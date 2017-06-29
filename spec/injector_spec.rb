require "spec_helper"

module InjectorSpec

  class C
    attr_reader :foo

    def initialize(foo)
      @foo = foo
    end
  end

  describe Injector do

    before(:example) do
      @inj = Injector::Injector.new()
    end

    it "has a version number" do
      expect(Injector::VERSION).not_to be nil
    end

    it "handles out of order registration" do
      @inj.register :c do |inj|
        C.new(inj.foo)
      end
      @inj.register :foo do |inj|
        :foo
      end
      expect(@inj.c.foo).to eq(:foo)
    end

    it "creates singletons by default" do
      @inj.register :c do |inj|
        C.new(inj.foo)
      end
      @inj.register :foo do |inj|
        :foo
      end
      expect(@inj.c).to equal(@inj.c)
    end

    it "creates non-singletons" do
      @inj.register :c, singleton=false do |inj|
        C.new(inj.foo)
      end
      @inj.register :foo do |inj|
        :foo
      end
      expect(@inj.c).not_to equal(@inj.c)
    end
  end

end
