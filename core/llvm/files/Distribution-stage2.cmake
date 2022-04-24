set(CMAKE_SYSTEM_NAME Linux CACHE STRING "")

set(LLVM_ENABLE_PROJECTS "llvm;clang;lld;polly;clang-tools-extra" CACHE STRING "")
set(LLVM_TARGETS_TO_BUILD ARM;AArch64;AMDGPU;PowerPC;RISCV;X86 CACHE STRING "")

set(LLVM_CCACHE_BUILD "OFF" CACHE STRING "")
set(CMAKE_BUILD_TYPE Release CACHE STRING "")
set(CLANG_DEFAULT_CXX_STDLIB "libc++" CACHE STRING "")
set(CLANG_DEFAULT_LINKER "ld.lld" CACHE STRING "")
set(CLANG_DEFAULT_RTLIB "compiler-rt" CACHE STRING "")
set(CLANG_DEFAULT_UNWINDLIB "libunwind" CACHE STRING "")
set(COMPILER_RT_BUILD_BUILTINS "ON" CACHE STRING "")
set(COMPILER_RT_BUILD_CRT "ON" CACHE STRING "")
set(COMPILER_RT_BUILD_GWP_ASAN "OFF" CACHE STRING "")
set(COMPILER_RT_BUILD_LIBFUZZER "ON" CACHE STRING "")
set(COMPILER_RT_BUILD_ORC "ON" CACHE STRING "")
set(COMPILER_RT_BUILD_PROFILE "ON" CACHE STRING "")
set(COMPILER_RT_BUILD_SANITIZERS "ON" CACHE STRING "")
set(COMPILER_RT_BUILD_XRAY "ON" CACHE STRING "")
set(COMPILER_RT_DEFAULT_TARGET_ONLY "ON" CACHE STRING "")
set(CXX_SUPPORTS_CUSTOM_LINKER "ON" CACHE STRING "")
set(LIBCXXABI_USE_COMPILER_RT "ON" CACHE STRING "")
set(LIBCXXABI_USE_LLVM_UNWINDER "ON" CACHE STRING "")
set(LIBCXX_CXX_ABI "libcxxabi" CACHE STRING "")
set(LIBCXX_HAS_MUSL_LIBC "ON" CACHE STRING "")
set(LIBCXX_INCLUDE_BENCHMARKS "OFF" CACHE STRING "")
set(LIBCXX_INCLUDE_TESTS "OFF" CACHE STRING "")
set(LIBCXX_USE_COMPILER_RT "ON" CACHE STRING "")
set(LIBUNWIND_ENABLE_CROSS_UNWINDING "ON" CACHE STRING "")
set(LIBUNWIND_SUPPORTS_FNO_EXCEPTIONS_FLAG "ON" CACHE STRING "")
set(LIBUNWIND_SUPPORTS_FNO_RTTI_FLAG "ON" CACHE STRING "")
set(LIBUNWIND_SUPPORTS_NODEFAULTLIBS_FLAG "ON" CACHE STRING "")
set(LIBUNWIND_USE_COMPILER_RT ON CACHE STRING "")
set(LLDB_ENABLE_CURSES 0 CACHE STRING "")
set(LLDB_ENABLE_LIBEDIT 0 CACHE STRING "")
set(LLDB_ENABLE_PYTHON 0 CACHE STRING "")
set(LLVM_BUILD_BENCHMARKS "OFF" CACHE STRING "")
set(LLVM_BUILD_COMPILER_RT "ON" CACHE STRING "")
set(LLVM_BUILD_DOCS "OFF" CACHE STRING "")
set(LLVM_BUILD_EXAMPLES "OFF" CACHE STRING "")
set(LLVM_BUILD_TESTS "OFF" CACHE STRING "")
set(LLVM_ENABLE_TERMINFO 0 CACHE STRING "")
set(LLVM_ENABLE_LIBCXX ON CACHE STRING "")
set(LLVM_ENABLE_LLD ON CACHE STRING "")
set(LLVM_ENABLE_RTTI ON CACHE STRING "")
set(LLVM_ENABLE_PER_TARGET_RUNTIME_DIR OFF CACHE STRING "")
set(PPC_LINUX_DEFAULT_IEEELONGDOUBLE ON CACHE STRING "")
set(OPENMP_ENABLE_LIBOMPTARGET OFF CACHE STRING "")
set(OPENMP_ENABLE_LIBOMPTARGET_PROFILING OFF CACHE STRING "")
set(OPENMP_ENABLE_OMPT_TOOLS OFF CACHE STRING "")
set(LLVM_LINK_LLVM_DYLIB OFF CACHE STRING "")
set(LLVM_ENABLE_ZLIB "OFF" CACHE STRING "")

SET(CMAKE_C_COMPILER   clang)
SET(CMAKE_CXX_COMPILER clang++)

set(LLVM_BUILTIN_TARGETS "default;powerpc64-linux-musl;powerpc-linux-musl;powerpc64le-linux-musl;powerpcle-linux-musl;armv7-linux-musleabihf;armv6m-linux-musleabi;aarch64-linux-musl;aarch64_be-linux-musl;riscv64-linux-musl;riscv32-linux-musl;i386-linux-musl;x86_64-linux-musl" CACHE STRING "")

# setup toolchain
set(LLVM_INSTALL_TOOLCHAIN_ONLY OFF CACHE BOOL "")
set(LLVM_DYLIB_COMPONENTS all CACHE STRING "")
set(LLVM_TOOLCHAIN_TOOLS
   dsymutil
   llc
   lli
   llvm-addr2line
   llvm-ar
   llvm-as
   llvm-config
   llvm-cov
   llvm-cxxfilt
   llvm-cxxmap
   llvm-diff
   llvm-dis
   llvm-dwarfdump
   llvm-lib
   llvm-link
   llvm-lipo
   llvm-lto
   llvm-lto2
   llvm-mca
   llvm-nm
   llvm-objcopy
   llvm-objdump
   llvm-otool
   llvm-profdata
   llvm-ranlib
   llvm-readobj
   llvm-size
   llvm-stress
   llvm-strings
   llvm-strip
   llvm-symbolizer
   llvm-tblgen
   llvm-xray
   opt
   opt-viewer
  CACHE STRING "")


set(LLVM_DISTRIBUTION_COMPONENTS
  llvm-libraries
  llvm-headers
  cmake-exports
  clang-cmake-exports
  clang
  libclang
  libclang-headers
  clang-cpp
  lld
  clangd
  LTO
  Polly
  clang-format
  clang-headers
  clang-resource-headers
  builtins
  runtimes
  ${LLVM_TOOLCHAIN_TOOLS}
  CACHE STRING "")
