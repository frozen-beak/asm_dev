;; A simple tool to created in x86 asm (nasm) to
;; convert mp4 to gif using ffmpeg
;;
;; Steps to assemble, link and run:
;;
;;  1. Compile w/ `nasm -f elf64 v2g.asm -o v2g.o`
;;  2. Link w/ `gcc -no-pie v2g.o -o v2g`
;;  3. Run w/ `./v2g input.mp4 output.gif`

global  main

extern  fprintf
extern  perror
extern  execvp
extern  exit
extern  stderr

section .data
    usage_msg  db "Usage: %s <input_video> <output.gif>", 10, 0
    filter_str db "fps=25,scale=500:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse", 0
    ffmpeg_str db "ffmpeg", 0
    i_flag     db "-i", 0
    vf_flag    db "-vf", 0
    y_flag     db "-y", 0
    error_msg  db "Error executing ffmpeg", 0

section .text
main:
    ;; prolouge to preserve stack pointer
    push rbp
    mov  rbp, rsp
    sub  rsp, 8   ; Align stack to a 16-byte boundary

    ;; Check if `argc != 3`
    ;; Note: `argc` also includes the program name
    cmp rdi, 3
    je  args_ok

    ;; print error using `fprintf`
    ;;
    ;; We are calling:
    ;;  `fprintf(stderr, msg, argv[0]);`
    mov  rax, [rsi]        ; rax = argv[0]
    mov  rdi, [rel stderr] ; stderr
    mov  rsi, usage_msg    ; msg
    mov  rdx, rax          ; argv[0]
    call fprintf

    ;; exit with status `1`
    mov  edi, 1
    call exit

args_ok:
    ;; Retrieve args
    ;;   input video  = argv[1]
    ;;   output gif   = argv[2]
    mov r8, [rsi+8]  ; pointer to input video
    mov r9, [rsi+16] ; pointer to output gif

    ;; Allocate space on the stack for the execvp argument array.
    ;; We need 8 pointers (each 8 bytes) → 8 * 8 = 64 bytes.
    sub rsp, 64
    mov rax, rsp

    ;; Build the argument array
    mov qword [rax],    ffmpeg_str ; argv[0]
    mov qword [rax+8],  i_flag     ; argv[1]
    mov qword [rax+16], r8         ; argv[2]: input video
    mov qword [rax+24], vf_flag    ; argv[3]
    mov qword [rax+32], filter_str ; argv[4]
    mov qword [rax+40], y_flag     ; argv[5]
    mov qword [rax+48], r9         ; argv[6]: output gif
    mov qword [rax+56], 0          ; argv[7] = NULL

    ;; Execute command using,
    ;;  `execvp("ffmpeg", argv_array)`
    mov  rdi, ffmpeg_str ; command to execute
    mov  rsi, rax        ; pointer to argument array
    call execvp

    ;; Check for any errors, if any call
    ;;  `perror("err msg");`
    mov  rdi, error_msg
    call perror

    ;; Exit with error code 1
    mov  edi, 1
    call exit
