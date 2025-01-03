.model      small
.386
.stack      100h
.data
    A           dd      +52.0
    B           dd      -52.0
    C           dd      +52.0
    D           dd      ?
    six         dd      +6.0
    minus19     dd      -19.0
    plus28      dd      +28.0
.code
Start:
    mov     ax,@data
    mov     ds,ax
    mov     es,ax
    fld     A
    fmul    B
    fmul    six
    fadd    C
    jz      Exit
    fld     B
    fmul    B
    fmul    B
    fmul    plus28
    fadd    C
    fsub    minus19
    fdiv    st,st(1)
    fist    D
Exit:
    mov     ah,4Ch
    int     21h
    end     Start 