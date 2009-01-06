#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2008 Engine Yard, Inc. All rights reserved.
#This code was directly ported from <https://GitHub.Com/RubySpec/RubySpec/tree/master/language/not_spec.rb>

require File.expand_path File.join(File.dirname(__FILE__), 'spec_helper')

require 'b001e'

describe "The 'not' operator" do
  it 'turns false to true' do
    false.not.must_equal true
  end

  it 'turns nil to true' do
    nil.not.must_equal true
  end

  it 'turns true to false' do
    true.not.must_equal false
  end

  it 'turns anything not nil to false' do
    MiniTest::Mock.new.not.must_equal false
  end
end
