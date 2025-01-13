.model      small
.386
.stack      100h
.data
    A           dd      ?
    B           dd      ?
    C           dd      ?
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
    fld     B
    fmul    st(1),st
    fxch    st(1)
    fmul    six
    fld     C
    fadd    st(1),st
    jz      Exit
    fxch    st(2)
    fld     st
    fmul    st,st(1)
    fmul    st,st(1)
    fmul    plus28
    fadd    st,st(3)
    fsub    minus19
    fdiv    st,st(2)
    fist    D
Exit:
    mov     ah,4Ch
    int     21h
    end     Start 