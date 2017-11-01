require "./int.cr"

lib LibSTM32
    fun init_led

    PERIPH_BASE = 0x40000000
    APB2PERIPH_BASE = (PERIPH_BASE + 0x10000)
    GPIOC_BASE = (APB2PERIPH_BASE + 0x1000)

    struct GPIO_TypeDef
        crl : UInt32
        crh : UInt32
        idr : UInt32
        odr : UInt32
        bsrr : UInt32
        brr : UInt32
        lckr : UInt32
    end
end

LibSTM32.init_led

a = Pointer(LibSTM32::GPIO_TypeDef).new(LibSTM32::GPIOC_BASE.to_u64)
a.value.bsrr = 0x00001000
