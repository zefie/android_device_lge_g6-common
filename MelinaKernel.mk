# Melina Override, if exists, and is supported device

ifneq ($(filter h870 h872 us997 h870ds,$(TARGET_DEVICE)),)
  # If Melina-specific config file exists
  ifneq ($(wildcard $(TARGET_KERNEL_SOURCE)/arch/$(TARGET_KERNEL_ARCH)/configs/melina_common_subconfig),)
    # Then use Melina Kernel
    TARGET_KERNEL_CLANG_COMPILE := false # BT is broken on clang builds
#   TARGET_KERNEL_CLANG_VERSION := r349610 # Uncomment when using clang

    # Melina overrides any specific TARGET_KERNEL_CONFIG in device BoardConfig.mk

    ifeq ($(TARGET_DEVICE),us997)
      TARGET_KERNEL_CONFIG := lucye_nao_us-perf_defconfig
    endif

    ifeq ($(TARGET_DEVICE),h872)
      TARGET_KERNEL_CONFIG := lucye_tmo_us-perf_defconfig
    endif

    ifneq ($(filter h870 h870ds,$(TARGET_DEVICE)),)
      TARGET_KERNEL_CONFIG := lucye_global_com-perf_defconfig
    endif

    BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
    TARGET_KERNEL_ADDITIONAL_CONFIG := melina_common_android_intree_subconfig
    # If ubertc exists where we expect it
    ifneq ($(wildcard $(PWD)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-6.x-ubertc/bin),)
      # Then use it
      TARGET_KERNEL_CROSS_COMPILE_PATH := $(PWD)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-6.x-ubertc/bin
      TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
    endif
    KERNEL_TOOLCHAIN := $(TARGET_KERNEL_CROSS_COMPILE_PATH)
    KERNEL_TOOLCHAIN_PREFIX := $(TARGET_KERNEL_CROSS_COMPILE_PREFIX)

    # If ubertc exists where we expect it
    ifneq ($(wildcard $(PWD)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-6.x-ubertc/bin),)
      # Then use it
      TARGET_KERNEL_CROSS_COMPILE_32BITS_PATH := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-6.x-ubertc/bin
      TARGET_KERNEL_CROSS_COMPILE_32BITS_PREFIX := arm-linux-androideabi-
    else
      # We need a 32-bit toolchain for VDSO32 and havoc kernel build does not add it, so we will add Android GCC here
      TARGET_KERNEL_CROSS_COMPILE_32BITS_PATH := $(PWD)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin
      TARGET_KERNEL_CROSS_COMPILE_32BITS_PREFIX := arm-linux-androideabi-
    endif

    # Use variable provided by havoc to provide ARM32 Toolchain support to make environment for VDSO32
    TARGET_KERNEL_ADDITIONAL_FLAGS := \
	CROSS_COMPILE_ARM32=$(TARGET_KERNEL_CROSS_COMPILE_32BITS_PATH)/$(TARGET_KERNEL_CROSS_COMPILE_32BITS_PREFIX)
  else
    # If lineageos_device_defconfig exists..
    ifneq ($(wildcard $(TARGET_KERNEL_SOURCE)/arch/$(TARGET_KERNEL_ARCH)/configs/lineageos_$(TARGET_DEVICE)_defconfig),)
      # Then fail back to lineageos_device_defconfig, but only if TARGET_KERNEL_CONFIG is not already defined
      # Otherwise expect TARGET_KERNEL_CONFIG to be defined
      TARGET_KERNEL_CONFIG ?= lineageos_$(TARGET_DEVICE)_defconfig
    endif
  endif
endif