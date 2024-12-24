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
    fld     A ;s0 = A
    fld     B ; s0 = B, s1 = A
    fmul    st(1),st(0); s0 = b, s1 = ab
    fxch    st(1) ; s0 = ab, s1 = b
    fmul    six; s0 = 6ab, s1 = b
    fld     C; s0 = c, s1 = 6ab, s2 = b
    fadd    st(1),st(0); s0 = c, s1 = 6ab + c, s2 = b
    jz      Exit
    fxch    st(2) ; s0 = b, s1 = 6ab + c, s2 = c
    fld     st(0) ; s0 = b, s1 = b, s2 = 6ab + c, s3 = c
    fmul    st(0),st(1); s0 = b^2, s1 = b, s2 = 6ab + c, s3 = c
    fmul    st(0),st(1); s0 = b^3, s1 = b, s2 = 6ab + c, s3 = c
    fmul    plus28 ; s0 = 28b^3, s1 = b, s2 = 6ab + c, s3 = c
    fadd    st(0),st(3); s0 = 28b^3 + c, s1 = b, s2 = 6ab + c, s3 = c
    fsub    minus19; s0 = 28b^3 + c - 19, s1 = b, s2 = 6ab + c, s3 = c
    fdiv    st(0),st(2); s0 = 28b^3 + c - 19, s1 = b, s2 = 6ab + c, s3 = c
    fist    D ; D = result
Exit:
    mov     ah,04ch
    mov     al,0
    int     21h
    end     Start 