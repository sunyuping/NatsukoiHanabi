; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512f | FileCheck %s --check-prefix=AVX --check-prefix=AVX512 --check-prefix=AVX512F
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512bw | FileCheck %s --check-prefix=AVX --check-prefix=AVX512 --check-prefix=AVX512BW

;
; sdiv by 7
;

define <8 x i64> @test_div7_8i64(<8 x i64> %a) nounwind {
; AVX-LABEL: test_div7_8i64:
; AVX:       # %bb.0:
; AVX-NEXT:    vextracti32x4 $3, %zmm0, %xmm1
; AVX-NEXT:    vpextrq $1, %xmm1, %rax
; AVX-NEXT:    movabsq $5270498306774157605, %rcx # imm = 0x4924924924924925
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm2
; AVX-NEXT:    vmovq %xmm1, %rax
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm1
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm2[0]
; AVX-NEXT:    vextracti32x4 $2, %zmm0, %xmm2
; AVX-NEXT:    vpextrq $1, %xmm2, %rax
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm3
; AVX-NEXT:    vmovq %xmm2, %rax
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm2
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm2 = xmm2[0],xmm3[0]
; AVX-NEXT:    vinserti128 $1, %xmm1, %ymm2, %ymm1
; AVX-NEXT:    vextracti128 $1, %ymm0, %xmm2
; AVX-NEXT:    vpextrq $1, %xmm2, %rax
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm3
; AVX-NEXT:    vmovq %xmm2, %rax
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm2
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm2 = xmm2[0],xmm3[0]
; AVX-NEXT:    vpextrq $1, %xmm0, %rax
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm3
; AVX-NEXT:    vmovq %xmm0, %rax
; AVX-NEXT:    imulq %rcx
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm0
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm3[0]
; AVX-NEXT:    vinserti128 $1, %xmm2, %ymm0, %ymm0
; AVX-NEXT:    vinserti64x4 $1, %ymm1, %zmm0, %zmm0
; AVX-NEXT:    retq
  %res = sdiv <8 x i64> %a, <i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7>
  ret <8 x i64> %res
}

define <16 x i32> @test_div7_16i32(<16 x i32> %a) nounwind {
; AVX-LABEL: test_div7_16i32:
; AVX:       # %bb.0:
; AVX-NEXT:    vpbroadcastd {{.*#+}} zmm1 = [2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027]
; AVX-NEXT:    vpmuldq %zmm1, %zmm0, %zmm2
; AVX-NEXT:    vpshufd {{.*#+}} zmm1 = zmm1[1,1,3,3,5,5,7,7,9,9,11,11,13,13,15,15]
; AVX-NEXT:    vpshufd {{.*#+}} zmm3 = zmm0[1,1,3,3,5,5,7,7,9,9,11,11,13,13,15,15]
; AVX-NEXT:    vpmuldq %zmm1, %zmm3, %zmm1
; AVX-NEXT:    vmovdqa32 {{.*#+}} zmm3 = [1,17,3,19,5,21,7,23,9,25,11,27,13,29,15,31]
; AVX-NEXT:    vpermi2d %zmm1, %zmm2, %zmm3
; AVX-NEXT:    vpaddd %zmm0, %zmm3, %zmm0
; AVX-NEXT:    vpsrld $31, %zmm0, %zmm1
; AVX-NEXT:    vpsrad $2, %zmm0, %zmm0
; AVX-NEXT:    vpaddd %zmm1, %zmm0, %zmm0
; AVX-NEXT:    retq
  %res = sdiv <16 x i32> %a, <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <16 x i32> %res
}

define <32 x i16> @test_div7_32i16(<32 x i16> %a) nounwind {
; AVX512F-LABEL: test_div7_32i16:
; AVX512F:       # %bb.0:
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm2 = [18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725]
; AVX512F-NEXT:    vpmulhw %ymm2, %ymm0, %ymm0
; AVX512F-NEXT:    vpsrlw $15, %ymm0, %ymm3
; AVX512F-NEXT:    vpsraw $1, %ymm0, %ymm0
; AVX512F-NEXT:    vpaddw %ymm3, %ymm0, %ymm0
; AVX512F-NEXT:    vpmulhw %ymm2, %ymm1, %ymm1
; AVX512F-NEXT:    vpsrlw $15, %ymm1, %ymm2
; AVX512F-NEXT:    vpsraw $1, %ymm1, %ymm1
; AVX512F-NEXT:    vpaddw %ymm2, %ymm1, %ymm1
; AVX512F-NEXT:    retq
;
; AVX512BW-LABEL: test_div7_32i16:
; AVX512BW:       # %bb.0:
; AVX512BW-NEXT:    vpmulhw {{.*}}(%rip), %zmm0, %zmm0
; AVX512BW-NEXT:    vpsrlw $15, %zmm0, %zmm1
; AVX512BW-NEXT:    vpsraw $1, %zmm0, %zmm0
; AVX512BW-NEXT:    vpaddw %zmm1, %zmm0, %zmm0
; AVX512BW-NEXT:    retq
  %res = sdiv <32 x i16> %a, <i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7>
  ret <32 x i16> %res
}

define <64 x i8> @test_div7_64i8(<64 x i8> %a) nounwind {
; AVX512F-LABEL: test_div7_64i8:
; AVX512F:       # %bb.0:
; AVX512F-NEXT:    vextracti128 $1, %ymm0, %xmm2
; AVX512F-NEXT:    vpmovsxbw %xmm2, %ymm2
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm3 = [65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427]
; AVX512F-NEXT:    vpmullw %ymm3, %ymm2, %ymm2
; AVX512F-NEXT:    vpsrlw $8, %ymm2, %ymm2
; AVX512F-NEXT:    vpmovsxbw %xmm0, %ymm4
; AVX512F-NEXT:    vpmullw %ymm3, %ymm4, %ymm4
; AVX512F-NEXT:    vpsrlw $8, %ymm4, %ymm4
; AVX512F-NEXT:    vperm2i128 {{.*#+}} ymm5 = ymm4[2,3],ymm2[2,3]
; AVX512F-NEXT:    vinserti128 $1, %xmm2, %ymm4, %ymm2
; AVX512F-NEXT:    vpackuswb %ymm5, %ymm2, %ymm2
; AVX512F-NEXT:    vpaddb %ymm0, %ymm2, %ymm0
; AVX512F-NEXT:    vpsrlw $7, %ymm0, %ymm2
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm4 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
; AVX512F-NEXT:    vpand %ymm4, %ymm2, %ymm2
; AVX512F-NEXT:    vpsrlw $2, %ymm0, %ymm0
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm5 = [63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63]
; AVX512F-NEXT:    vpand %ymm5, %ymm0, %ymm0
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm6 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
; AVX512F-NEXT:    vpxor %ymm6, %ymm0, %ymm0
; AVX512F-NEXT:    vpsubb %ymm6, %ymm0, %ymm0
; AVX512F-NEXT:    vpaddb %ymm2, %ymm0, %ymm0
; AVX512F-NEXT:    vextracti128 $1, %ymm1, %xmm2
; AVX512F-NEXT:    vpmovsxbw %xmm2, %ymm2
; AVX512F-NEXT:    vpmullw %ymm3, %ymm2, %ymm2
; AVX512F-NEXT:    vpsrlw $8, %ymm2, %ymm2
; AVX512F-NEXT:    vpmovsxbw %xmm1, %ymm7
; AVX512F-NEXT:    vpmullw %ymm3, %ymm7, %ymm3
; AVX512F-NEXT:    vpsrlw $8, %ymm3, %ymm3
; AVX512F-NEXT:    vperm2i128 {{.*#+}} ymm7 = ymm3[2,3],ymm2[2,3]
; AVX512F-NEXT:    vinserti128 $1, %xmm2, %ymm3, %ymm2
; AVX512F-NEXT:    vpackuswb %ymm7, %ymm2, %ymm2
; AVX512F-NEXT:    vpaddb %ymm1, %ymm2, %ymm1
; AVX512F-NEXT:    vpsrlw $7, %ymm1, %ymm2
; AVX512F-NEXT:    vpand %ymm4, %ymm2, %ymm2
; AVX512F-NEXT:    vpsrlw $2, %ymm1, %ymm1
; AVX512F-NEXT:    vpand %ymm5, %ymm1, %ymm1
; AVX512F-NEXT:    vpxor %ymm6, %ymm1, %ymm1
; AVX512F-NEXT:    vpsubb %ymm6, %ymm1, %ymm1
; AVX512F-NEXT:    vpaddb %ymm2, %ymm1, %ymm1
; AVX512F-NEXT:    retq
;
; AVX512BW-LABEL: test_div7_64i8:
; AVX512BW:       # %bb.0:
; AVX512BW-NEXT:    vpmovsxbw %ymm0, %zmm1
; AVX512BW-NEXT:    vmovdqa64 {{.*#+}} zmm2 = [65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427]
; AVX512BW-NEXT:    vpmullw %zmm2, %zmm1, %zmm1
; AVX512BW-NEXT:    vpsrlw $8, %zmm1, %zmm1
; AVX512BW-NEXT:    vpmovwb %zmm1, %ymm1
; AVX512BW-NEXT:    vextracti64x4 $1, %zmm0, %ymm3
; AVX512BW-NEXT:    vpmovsxbw %ymm3, %zmm3
; AVX512BW-NEXT:    vpmullw %zmm2, %zmm3, %zmm2
; AVX512BW-NEXT:    vpsrlw $8, %zmm2, %zmm2
; AVX512BW-NEXT:    vpmovwb %zmm2, %ymm2
; AVX512BW-NEXT:    vinserti64x4 $1, %ymm2, %zmm1, %zmm1
; AVX512BW-NEXT:    vpaddb %zmm0, %zmm1, %zmm0
; AVX512BW-NEXT:    vpsrlw $2, %zmm0, %zmm1
; AVX512BW-NEXT:    vpandq {{.*}}(%rip), %zmm1, %zmm1
; AVX512BW-NEXT:    vmovdqa64 {{.*#+}} zmm2 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
; AVX512BW-NEXT:    vpxorq %zmm2, %zmm1, %zmm1
; AVX512BW-NEXT:    vpsubb %zmm2, %zmm1, %zmm1
; AVX512BW-NEXT:    vpsrlw $7, %zmm0, %zmm0
; AVX512BW-NEXT:    vpandq {{.*}}(%rip), %zmm0, %zmm0
; AVX512BW-NEXT:    vpaddb %zmm0, %zmm1, %zmm0
; AVX512BW-NEXT:    retq
  %res = sdiv <64 x i8> %a, <i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7>
  ret <64 x i8> %res
}

;
; srem by 7
;

define <8 x i64> @test_rem7_8i64(<8 x i64> %a) nounwind {
; AVX-LABEL: test_rem7_8i64:
; AVX:       # %bb.0:
; AVX-NEXT:    vextracti32x4 $3, %zmm0, %xmm1
; AVX-NEXT:    vpextrq $1, %xmm1, %rcx
; AVX-NEXT:    movabsq $5270498306774157605, %rsi # imm = 0x4924924924924925
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm2
; AVX-NEXT:    vmovq %xmm1, %rcx
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm1
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm2[0]
; AVX-NEXT:    vextracti32x4 $2, %zmm0, %xmm2
; AVX-NEXT:    vpextrq $1, %xmm2, %rcx
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm3
; AVX-NEXT:    vmovq %xmm2, %rcx
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm2
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm2 = xmm2[0],xmm3[0]
; AVX-NEXT:    vinserti128 $1, %xmm1, %ymm2, %ymm1
; AVX-NEXT:    vextracti128 $1, %ymm0, %xmm2
; AVX-NEXT:    vpextrq $1, %xmm2, %rcx
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm3
; AVX-NEXT:    vmovq %xmm2, %rcx
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm2
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm2 = xmm2[0],xmm3[0]
; AVX-NEXT:    vpextrq $1, %xmm0, %rcx
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm3
; AVX-NEXT:    vmovq %xmm0, %rcx
; AVX-NEXT:    movq %rcx, %rax
; AVX-NEXT:    imulq %rsi
; AVX-NEXT:    movq %rdx, %rax
; AVX-NEXT:    shrq $63, %rax
; AVX-NEXT:    sarq %rdx
; AVX-NEXT:    addq %rax, %rdx
; AVX-NEXT:    leaq (,%rdx,8), %rax
; AVX-NEXT:    subq %rdx, %rax
; AVX-NEXT:    subq %rax, %rcx
; AVX-NEXT:    vmovq %rcx, %xmm0
; AVX-NEXT:    vpunpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm3[0]
; AVX-NEXT:    vinserti128 $1, %xmm2, %ymm0, %ymm0
; AVX-NEXT:    vinserti64x4 $1, %ymm1, %zmm0, %zmm0
; AVX-NEXT:    retq
  %res = srem <8 x i64> %a, <i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7>
  ret <8 x i64> %res
}

define <16 x i32> @test_rem7_16i32(<16 x i32> %a) nounwind {
; AVX-LABEL: test_rem7_16i32:
; AVX:       # %bb.0:
; AVX-NEXT:    vpbroadcastd {{.*#+}} zmm1 = [2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027,2454267027]
; AVX-NEXT:    vpmuldq %zmm1, %zmm0, %zmm2
; AVX-NEXT:    vpshufd {{.*#+}} zmm1 = zmm1[1,1,3,3,5,5,7,7,9,9,11,11,13,13,15,15]
; AVX-NEXT:    vpshufd {{.*#+}} zmm3 = zmm0[1,1,3,3,5,5,7,7,9,9,11,11,13,13,15,15]
; AVX-NEXT:    vpmuldq %zmm1, %zmm3, %zmm1
; AVX-NEXT:    vmovdqa32 {{.*#+}} zmm3 = [1,17,3,19,5,21,7,23,9,25,11,27,13,29,15,31]
; AVX-NEXT:    vpermi2d %zmm1, %zmm2, %zmm3
; AVX-NEXT:    vpaddd %zmm0, %zmm3, %zmm1
; AVX-NEXT:    vpsrld $31, %zmm1, %zmm2
; AVX-NEXT:    vpsrad $2, %zmm1, %zmm1
; AVX-NEXT:    vpaddd %zmm2, %zmm1, %zmm1
; AVX-NEXT:    vpmulld {{.*}}(%rip){1to16}, %zmm1, %zmm1
; AVX-NEXT:    vpsubd %zmm1, %zmm0, %zmm0
; AVX-NEXT:    retq
  %res = srem <16 x i32> %a, <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <16 x i32> %res
}

define <32 x i16> @test_rem7_32i16(<32 x i16> %a) nounwind {
; AVX512F-LABEL: test_rem7_32i16:
; AVX512F:       # %bb.0:
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm2 = [18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725,18725]
; AVX512F-NEXT:    vpmulhw %ymm2, %ymm0, %ymm3
; AVX512F-NEXT:    vpsrlw $15, %ymm3, %ymm4
; AVX512F-NEXT:    vpsraw $1, %ymm3, %ymm3
; AVX512F-NEXT:    vpaddw %ymm4, %ymm3, %ymm3
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm4 = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
; AVX512F-NEXT:    vpmullw %ymm4, %ymm3, %ymm3
; AVX512F-NEXT:    vpsubw %ymm3, %ymm0, %ymm0
; AVX512F-NEXT:    vpmulhw %ymm2, %ymm1, %ymm2
; AVX512F-NEXT:    vpsrlw $15, %ymm2, %ymm3
; AVX512F-NEXT:    vpsraw $1, %ymm2, %ymm2
; AVX512F-NEXT:    vpaddw %ymm3, %ymm2, %ymm2
; AVX512F-NEXT:    vpmullw %ymm4, %ymm2, %ymm2
; AVX512F-NEXT:    vpsubw %ymm2, %ymm1, %ymm1
; AVX512F-NEXT:    retq
;
; AVX512BW-LABEL: test_rem7_32i16:
; AVX512BW:       # %bb.0:
; AVX512BW-NEXT:    vpmulhw {{.*}}(%rip), %zmm0, %zmm1
; AVX512BW-NEXT:    vpsrlw $15, %zmm1, %zmm2
; AVX512BW-NEXT:    vpsraw $1, %zmm1, %zmm1
; AVX512BW-NEXT:    vpaddw %zmm2, %zmm1, %zmm1
; AVX512BW-NEXT:    vpmullw {{.*}}(%rip), %zmm1, %zmm1
; AVX512BW-NEXT:    vpsubw %zmm1, %zmm0, %zmm0
; AVX512BW-NEXT:    retq
  %res = srem <32 x i16> %a, <i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7, i16 7>
  ret <32 x i16> %res
}

define <64 x i8> @test_rem7_64i8(<64 x i8> %a) nounwind {
; AVX512F-LABEL: test_rem7_64i8:
; AVX512F:       # %bb.0:
; AVX512F-NEXT:    vextracti128 $1, %ymm0, %xmm2
; AVX512F-NEXT:    vpmovsxbw %xmm2, %ymm3
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm2 = [65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427]
; AVX512F-NEXT:    vpmullw %ymm2, %ymm3, %ymm3
; AVX512F-NEXT:    vpsrlw $8, %ymm3, %ymm3
; AVX512F-NEXT:    vpmovsxbw %xmm0, %ymm4
; AVX512F-NEXT:    vpmullw %ymm2, %ymm4, %ymm4
; AVX512F-NEXT:    vpsrlw $8, %ymm4, %ymm4
; AVX512F-NEXT:    vperm2i128 {{.*#+}} ymm5 = ymm4[2,3],ymm3[2,3]
; AVX512F-NEXT:    vinserti128 $1, %xmm3, %ymm4, %ymm3
; AVX512F-NEXT:    vpackuswb %ymm5, %ymm3, %ymm3
; AVX512F-NEXT:    vpaddb %ymm0, %ymm3, %ymm3
; AVX512F-NEXT:    vpsrlw $7, %ymm3, %ymm5
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm4 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
; AVX512F-NEXT:    vpand %ymm4, %ymm5, %ymm7
; AVX512F-NEXT:    vpsrlw $2, %ymm3, %ymm3
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm5 = [63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63]
; AVX512F-NEXT:    vpand %ymm5, %ymm3, %ymm3
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm6 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
; AVX512F-NEXT:    vpxor %ymm6, %ymm3, %ymm3
; AVX512F-NEXT:    vpsubb %ymm6, %ymm3, %ymm3
; AVX512F-NEXT:    vpaddb %ymm7, %ymm3, %ymm7
; AVX512F-NEXT:    vpmovsxbw %xmm7, %ymm8
; AVX512F-NEXT:    vmovdqa {{.*#+}} ymm3 = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
; AVX512F-NEXT:    vpmullw %ymm3, %ymm8, %ymm8
; AVX512F-NEXT:    vpmovsxwd %ymm8, %zmm8
; AVX512F-NEXT:    vpmovdb %zmm8, %xmm8
; AVX512F-NEXT:    vextracti128 $1, %ymm7, %xmm7
; AVX512F-NEXT:    vpmovsxbw %xmm7, %ymm7
; AVX512F-NEXT:    vpmullw %ymm3, %ymm7, %ymm7
; AVX512F-NEXT:    vpmovsxwd %ymm7, %zmm7
; AVX512F-NEXT:    vpmovdb %zmm7, %xmm7
; AVX512F-NEXT:    vinserti128 $1, %xmm7, %ymm8, %ymm7
; AVX512F-NEXT:    vpsubb %ymm7, %ymm0, %ymm0
; AVX512F-NEXT:    vextracti128 $1, %ymm1, %xmm7
; AVX512F-NEXT:    vpmovsxbw %xmm7, %ymm7
; AVX512F-NEXT:    vpmullw %ymm2, %ymm7, %ymm7
; AVX512F-NEXT:    vpsrlw $8, %ymm7, %ymm7
; AVX512F-NEXT:    vpmovsxbw %xmm1, %ymm8
; AVX512F-NEXT:    vpmullw %ymm2, %ymm8, %ymm2
; AVX512F-NEXT:    vpsrlw $8, %ymm2, %ymm2
; AVX512F-NEXT:    vperm2i128 {{.*#+}} ymm8 = ymm2[2,3],ymm7[2,3]
; AVX512F-NEXT:    vinserti128 $1, %xmm7, %ymm2, %ymm2
; AVX512F-NEXT:    vpackuswb %ymm8, %ymm2, %ymm2
; AVX512F-NEXT:    vpaddb %ymm1, %ymm2, %ymm2
; AVX512F-NEXT:    vpsrlw $7, %ymm2, %ymm7
; AVX512F-NEXT:    vpand %ymm4, %ymm7, %ymm4
; AVX512F-NEXT:    vpsrlw $2, %ymm2, %ymm2
; AVX512F-NEXT:    vpand %ymm5, %ymm2, %ymm2
; AVX512F-NEXT:    vpxor %ymm6, %ymm2, %ymm2
; AVX512F-NEXT:    vpsubb %ymm6, %ymm2, %ymm2
; AVX512F-NEXT:    vpaddb %ymm4, %ymm2, %ymm2
; AVX512F-NEXT:    vpmovsxbw %xmm2, %ymm4
; AVX512F-NEXT:    vpmullw %ymm3, %ymm4, %ymm4
; AVX512F-NEXT:    vpmovsxwd %ymm4, %zmm4
; AVX512F-NEXT:    vpmovdb %zmm4, %xmm4
; AVX512F-NEXT:    vextracti128 $1, %ymm2, %xmm2
; AVX512F-NEXT:    vpmovsxbw %xmm2, %ymm2
; AVX512F-NEXT:    vpmullw %ymm3, %ymm2, %ymm2
; AVX512F-NEXT:    vpmovsxwd %ymm2, %zmm2
; AVX512F-NEXT:    vpmovdb %zmm2, %xmm2
; AVX512F-NEXT:    vinserti128 $1, %xmm2, %ymm4, %ymm2
; AVX512F-NEXT:    vpsubb %ymm2, %ymm1, %ymm1
; AVX512F-NEXT:    retq
;
; AVX512BW-LABEL: test_rem7_64i8:
; AVX512BW:       # %bb.0:
; AVX512BW-NEXT:    vpmovsxbw %ymm0, %zmm1
; AVX512BW-NEXT:    vmovdqa64 {{.*#+}} zmm2 = [65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427,65427]
; AVX512BW-NEXT:    vpmullw %zmm2, %zmm1, %zmm1
; AVX512BW-NEXT:    vpsrlw $8, %zmm1, %zmm1
; AVX512BW-NEXT:    vpmovwb %zmm1, %ymm1
; AVX512BW-NEXT:    vextracti64x4 $1, %zmm0, %ymm3
; AVX512BW-NEXT:    vpmovsxbw %ymm3, %zmm3
; AVX512BW-NEXT:    vpmullw %zmm2, %zmm3, %zmm2
; AVX512BW-NEXT:    vpsrlw $8, %zmm2, %zmm2
; AVX512BW-NEXT:    vpmovwb %zmm2, %ymm2
; AVX512BW-NEXT:    vinserti64x4 $1, %ymm2, %zmm1, %zmm1
; AVX512BW-NEXT:    vpaddb %zmm0, %zmm1, %zmm1
; AVX512BW-NEXT:    vpsrlw $2, %zmm1, %zmm2
; AVX512BW-NEXT:    vpandq {{.*}}(%rip), %zmm2, %zmm2
; AVX512BW-NEXT:    vmovdqa64 {{.*#+}} zmm3 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
; AVX512BW-NEXT:    vpxorq %zmm3, %zmm2, %zmm2
; AVX512BW-NEXT:    vpsubb %zmm3, %zmm2, %zmm2
; AVX512BW-NEXT:    vpsrlw $7, %zmm1, %zmm1
; AVX512BW-NEXT:    vpandq {{.*}}(%rip), %zmm1, %zmm1
; AVX512BW-NEXT:    vpaddb %zmm1, %zmm2, %zmm1
; AVX512BW-NEXT:    vpmovsxbw %ymm1, %zmm2
; AVX512BW-NEXT:    vmovdqa64 {{.*#+}} zmm3 = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7]
; AVX512BW-NEXT:    vpmullw %zmm3, %zmm2, %zmm2
; AVX512BW-NEXT:    vpmovwb %zmm2, %ymm2
; AVX512BW-NEXT:    vextracti64x4 $1, %zmm1, %ymm1
; AVX512BW-NEXT:    vpmovsxbw %ymm1, %zmm1
; AVX512BW-NEXT:    vpmullw %zmm3, %zmm1, %zmm1
; AVX512BW-NEXT:    vpmovwb %zmm1, %ymm1
; AVX512BW-NEXT:    vinserti64x4 $1, %ymm1, %zmm2, %zmm1
; AVX512BW-NEXT:    vpsubb %zmm1, %zmm0, %zmm0
; AVX512BW-NEXT:    retq
  %res = srem <64 x i8> %a, <i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7,i8 7, i8 7, i8 7, i8 7>
  ret <64 x i8> %res
}
