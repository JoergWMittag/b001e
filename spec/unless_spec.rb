#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2008 Engine Yard, Inc. All rights reserved.
#This code was directly ported from <https://GitHub.Com/RubySpec/RubySpec/tree/master/language/unless_spec.rb>

require File.expand_path File.join(File.dirname(__FILE__), 'spec_helper')

require 'b001e'

describe 'The unless expression' do
  it 'evaluates the unless body when the expression is false' do
    false.unlesselse ->() { @result = true }, ->() { @result = false }
    @result.must_equal true
  end

  it 'returns the last statement in the body' do
    false.unless do
      :foo
      :bar
    end.must_equal :bar
  end

  it 'evaluates the else body when the expression is true' do
    true.unlesselse(->() { :foo }, ->() { :bar }).must_equal :bar
  end

  it 'does not return a value when the expression is true' do
    true.unless.must_be_nil
  end
end
