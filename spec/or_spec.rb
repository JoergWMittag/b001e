#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2008 Engine Yard, Inc. All rights reserved.
#This code was directly ported from <https://GitHub.Com/RubySpec/RubySpec/tree/master/language/or_spec.rb>

require File.expand_path File.join(File.dirname(__FILE__), 'spec_helper')

require 'b001e'

describe "The 'or' operator" do
  it 'evaluates to true if any of its operands are true' do
    (false.or { true.or { nil } }).if { @result = true }
    @result.must_equal true
  end

  it 'evaluates to false if all of its operands are false' do
    (false.or { nil }).if { @result = true }
    @result.must_be_nil
  end

  it 'is evaluated before assignment operators' do
    x = nil.or { true }
    x.must_equal true
  end

  it 'is evaluated after variables are assigned' do
    (x = nil).or { true }
    x.must_be_nil
  end
end
