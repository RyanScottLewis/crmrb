module CRMRB

  @[Link(ldflags: "-L'#{__DIR__}/../../build/lib' -lcrmrb -lmruby")]
  lib Lib
    fun crmrb_execute(path : UInt8*) : Void
  end

end
