Serial:: ; marcelnote - optimized
	push af
	ldh a, [hSerialConnectionStatus]
	inc a
	ldh a, [rSB]
	ldh [hSerialReceiveData], a
	jr z, .connectionNotYetEstablished
	ldh a, [hSerialSendData]
.writeSB
	ldh [rSB], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .done
	ld a, SC_START | SC_EXTERNAL
	ldh [rSC], a
.done
	ld a, 1
	ldh [hSerialReceivedNewData], a
	ASSERT SERIAL_NO_DATA_BYTE == $ff ^ 1
	cpl ; a = SERIAL_NO_DATA_BYTE
	ldh [hSerialSendData], a
	pop af
	reti

.connectionNotYetEstablished
	ldh [hSerialConnectionStatus], a
	xor a
	jr .writeSB

; de = send data
; hl = receive data
; bc = length of data
Serial_ExchangeBytes:: ; marcelnote - optimized
	call .exchange
	cp SERIAL_PREAMBLE_BYTE
	jr nz, Serial_ExchangeBytes
.loop
	call .exchange
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

.exchange
	ld a, [de]
	ldh [hSerialSendData], a
	call Serial_ExchangeByte
	push af
	ld a, 48
.waitLoop
	dec a
	jr nz, .waitLoop
	pop af
	ret

; de = send data
Serial_ExchangeByte::
	xor a
	ldh [hSerialReceivedNewData], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .loop
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a
.loop
	ldh a, [hSerialReceivedNewData]
	and a
	jr nz, .ok
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr nz, .notPlayer1OrTimedOut
	call CheckLinkTimeoutFramesNonzero
	jr z, .notPlayer1OrTimedOut
	ld a, 18 ; marcelnote - increased from 15 to offset removed helper call
.wait18
	dec a
	jr nz, .wait18
	push hl
	ld hl, wLinkTimeoutFrames + 1
	inc [hl]
	jr nz, .noCarry
	dec hl
	inc [hl]
.noCarry
	pop hl
	call CheckLinkTimeoutFramesNonzero
	jr nz, .loop
	jr SerialDisconnected
.notPlayer1OrTimedOut
	ldh a, [rIE]
	and IE_SERIAL | IE_TIMER | IE_STAT | IE_VBLANK
	cp IE_SERIAL
	jr nz, .loop
	ld a, [wLinkByteTimeout]
	dec a
	ld [wLinkByteTimeout], a
	jr nz, .loop
	ld a, [wLinkByteTimeout + 1]
	dec a
	ld [wLinkByteTimeout + 1], a
	jr nz, .loop
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .ok
	ld a, 255
.wait255
	dec a
	jr nz, .wait255
.ok
	xor a
	ldh [hSerialReceivedNewData], a
	ldh a, [rIE]
	and IE_SERIAL | IE_TIMER | IE_STAT | IE_VBLANK
	sub IE_SERIAL
	jr nz, .nonSerialInterruptsEnabled
	ASSERT LOW(SERIAL_LINK_BYTE_TIMEOUT) == 0
	ld [wLinkByteTimeout], a ; a = 0
	ld a, HIGH(SERIAL_LINK_BYTE_TIMEOUT)
	ld [wLinkByteTimeout + 1], a
.nonSerialInterruptsEnabled
	ldh a, [hSerialReceiveData]
	cp SERIAL_NO_DATA_BYTE
	ret nz
	call CheckLinkTimeoutFramesNonzero
	jr z, .done
	push hl
	ld hl, wLinkTimeoutFrames + 1
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .noBorrow
	dec [hl]
.noBorrow
	pop hl
	call CheckLinkTimeoutFramesNonzero
	jr z, SerialDisconnected
.done
	ldh a, [rIE]
	and IE_SERIAL | IE_TIMER | IE_STAT | IE_VBLANK
	cp IE_SERIAL
	ld a, SERIAL_NO_DATA_BYTE
	ret z
	ld a, [de]
	ldh [hSerialSendData], a
	call DelayFrame
	jp Serial_ExchangeByte

CheckLinkTimeoutFramesNonzero::
	push hl
	ld hl, wLinkTimeoutFrames
	ld a, [hli]
	or [hl]
	pop hl
	ret

; This sets wLinkTimeoutFrames to $ffff, since
; a is always 0 when it is called.
SerialDisconnected::
	dec a
	ld [wLinkTimeoutFrames], a
	ld [wLinkTimeoutFrames + 1], a
	ret

; This is used to exchange the button press and selected menu item on the link menu.
; The data is sent thrice and read twice to increase reliability.
Serial_ExchangeLinkMenuSelection:: ; marcelnote - optimized
	ld de, wLinkMenuSelectionSendBuffer
	ld hl, wLinkMenuSelectionReceiveBuffer
	ld c, %110 ; discard first byte, store next two
.loop
	call DelayFrame
	ld a, [de]
	ldh [hSerialSendData], a
	call Serial_ExchangeByte
	inc de
	srl c
	jr nc, .loop ; store byte only if carry set
	ld [hli], a
	jr nz, .loop ; finish when c = 0
	ret

Serial_PrintWaitingTextAndSyncAndExchangeNybble::
	call SaveScreenTilesToBuffer1
	callfar PrintWaitingText
	call Serial_SyncAndExchangeNybble
	jp LoadScreenTilesFromBuffer1

Serial_SyncAndExchangeNybble::
	vc_hook Wireless_WaitLinkTransfer
	ld a, $ff
	ld [wSerialExchangeNybbleReceiveData], a
.loop1
	call Serial_ExchangeNybble
	call DelayFrame
	call CheckLinkTimeoutFramesNonzero
	jr z, .next1
	push hl
	ld hl, wLinkTimeoutFrames + 1
	dec [hl]
	jr nz, .next2
	dec hl
	dec [hl]
	jr nz, .next2
	pop hl
	xor a
	jr SerialDisconnected
.next2
	pop hl
.next1
	ld a, [wSerialExchangeNybbleReceiveData]
	inc a
	jr z, .loop1
	vc_patch Wireless_net_delay_3
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	ld b, 26
ELSE
	ld b, 10
ENDC
	vc_patch_end
.loop2
	call DelayFrame
	call Serial_ExchangeNybble
	dec b
	jr nz, .loop2
	vc_patch Wireless_net_delay_4
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	ld b, 26
ELSE
	ld b, 10
ENDC
	vc_patch_end
.loop3
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .loop3
	ld a, [wSerialExchangeNybbleReceiveData]
	ld [wSerialSyncAndExchangeNybbleReceiveData], a
	vc_hook Wireless_WaitLinkTransfer_ret
	ret

Serial_ExchangeNybble::
	call .doExchange
	ld a, [wSerialExchangeNybbleSendData]
	add $60
	ldh [hSerialSendData], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .doExchange
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a
.doExchange
	ldh a, [hSerialReceiveData]
	ld [wSerialExchangeNybbleTempReceiveData], a
	and $f0
	sub $60
	ret nz
	ldh [hSerialReceiveData], a ; a = 0
	ld a, [wSerialExchangeNybbleTempReceiveData]
	and $f
	ld [wSerialExchangeNybbleReceiveData], a
	ret

Serial_SendZeroByte::
	xor a
	ldh [hSerialSendData], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret nz
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a
	ret

Serial_TryEstablishingExternallyClockedConnection::
	ld a, ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK
	ldh [rSB], a
	xor a
	ldh [hSerialReceiveData], a
	ld a, SC_START | SC_EXTERNAL
	ldh [rSC], a
	ret
