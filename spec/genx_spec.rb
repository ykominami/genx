# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Genx do
  it "has a version number" do
    expect(Genx::VERSION).not_to be nil
  end

  context "create instance" do
    before(:all) do
      home_dir = '/home/ykominami'
      home_pn = Pathname.new(home_dir)
      home_genx_pn =home_pn.join('.genx')
      ary = ["data1.yml", "templ1.txt", "templ_vars.txt"].map{|x| home_genx_pn.join(x)}
      @argv = ["vars"] + ary
      @exit_success_code = 0
      @exit_error_code = 1
    end

    let(:instance)  { Genx::Genx.new(@argv) }

    it "Genx" do
      expect(instance).to_not eq(nil)
    end

    context "run" do
      let(:ret) {instance.run}
      it "" do
        expect(ret).to eq(@exit_success_code)
      end
    end

    let(:instance)  { Genx::Plugin.new(@argv) }

    it "Plugin" do
      expect(instance).to_not eq(nil)
    end

    context "run" do
      let(:ret) {instance.run}
      it "" do
        expect(ret).to eq(@exit_success_code)
      end
    end

    let(:instance)  { Genx::VarsPlugin.new(@argv) }

    it "VarsPlugin" do
      expect(instance).to_not eq(nil)
    end

    context "run" do
      let(:ret) {instance.run}
      it "" do
        expect(ret).to eq(@exit_success_code)
      end
    end

=begin
    context "run" do
      p "spec 2"
      let(:ret) {instance.run}
      it "run" do
        expect(ret).to eq(true)
      end
    end
=end
  end
end
