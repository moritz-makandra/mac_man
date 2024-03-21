module MacMan
  BROADCAST_BITMASK          = 0x01_00_00_00_00_00
  LOCAL_ADMINISTERED_BITMASK = 0x02_00_00_00_00_00

  class Address

    attr_accessor :address

    # MAC Address for manipulation
    #
    # @param address [String] A MAC address for manipulation
    # @param oui [Sring] The Organizationally Uniqe Identifier of the Address. The second half is randomized.
    def initialize(**args)
      if args[:address]
        @address = args[:address]
      elsif args[:oui]
        @address = (args[:oui] << 24 ) + rand(0..0xFFFFFF)
      else
        @address = rand(0..0xFF_FF_FF_FF_FF_FF)
        self.unset_broadcast_bit
        self.set_locally_administered_bit
      end
    end

    # Human readable Text representation of the address
    #
    # @param delimiter [String] Set the delimiter used to separate the address. Default: ':'(colon)
    def to_hex(delimiter: ':')
     @address.to_s(16).chars.each_slice(2).map(&:join).join(delimiter)
    end

    # Checks if the address is locally administered
    #
    # @see: https://en.wikipedia.org/wiki/MAC_address#Universal_vs._local_(U/L_bit)
    def locally_administered?
      (@address & LOCAL_ADMINISTERED_BITMASK) > 0
    end

    # Checks if the address has the broadcast flag set
    #
    # @see https://en.wikipedia.org/wiki/MAC_address#Unicast_vs._multicast_(I/G_bit)
    def broadcast_address?
      (@address & BROADCAST_BITMASK) > 0
    end

    # Enables the locally administered flag
    #
    # @see: https://en.wikipedia.org/wiki/MAC_address#Universal_vs._local_(U/L_bit)
    def set_locally_administered_bit
      @address |= LOCAL_ADMINISTERED_BITMASK
    end

    # Disables the Broadcast flag
    #
    # @see https://en.wikipedia.org/wiki/MAC_address#Unicast_vs._multicast_(I/G_bit)
    #
    def unset_broadcast_bit
      @address ^= BROADCAST_BITMASK
    end

    def to_s
      to_hex
    end

  end
end
