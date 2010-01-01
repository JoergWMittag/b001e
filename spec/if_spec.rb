#!/usr/bin/env ruby1.9
# vim: filetype=ruby, fileencoding=UTF-8, tabsize=2, shiftwidth=2

#Copyright (c) 2008 Engine Yard, Inc. All rights reserved.
#This code was directly ported from <https://GitHub.Com/RubySpec/RubySpec/tree/master/language/if_spec.rb>

require 'spec_helper'
require 'b001e'

describe 'The if expression' do
  before do
    @result = []
  end

  it 'evaluates body if expression is true' do
    true.if { @result << 123 }
    @result.must_equal [123]
  end

  it 'does not evaluate body if expression is false' do
    false.if { @result << 123 }
    @result.must_equal []
  end

  it 'does not evaluate else-body if expression is true' do
    true.ifelse ->{ @result << 123 }, ->{ @result << 456 }
    @result.must_equal [123]
  end

  it 'evaluates only else-body if expression is false' do
    false.ifelse ->{ @result << 123 }, ->{ @result << 456 }
    @result.must_equal [456]
  end

  it 'returns result of then-body evaluation if expression is true' do
    true.if { 123 }.must_equal 123
  end

  it 'returns result of last statement in then-body if expression is true' do
    true.if do
      :foo
      :bar
    end.must_equal :bar
  end

  it 'returns result of then-body evaluation if expression is true and else part is present' do
    true.ifelse(->{ 123 }, ->{ 456 }).must_equal 123
  end

  it 'returns result of else-body evaluation if expression is false' do
    false.ifelse(->{ 123 }, ->{ 456 }).must_equal 456
  end

  it 'returns nil if then-body is empty and expression is true' do
    true.if{}.must_be_nil
  end

  it 'returns nil if then-body is empty, expression is true and else part is present' do
    true.ifelse(->{}, ->{ 456 }).must_be_nil
  end

  it 'returns nil if then-body is empty, expression is true and else part is empty' do
    true.ifelse.must_be_nil
  end

  it 'returns nil if else-body is empty and expression is false' do
    false.ifelse(->{ 123 }).must_be_nil
  end

  it 'returns nil if else-body is empty, expression is false and then-body is empty' do
    false.ifelse.must_be_nil
  end

  it 'considers an expression with nil result as false' do
    nil.ifelse(->{ 123 }, ->{ 456 }).must_equal 456
  end

  it 'considers a non-nil and non-boolean object in expression result as true' do
    MiniTest::Mock.new.ifelse(->{ 123 }, ->{ 456 }).must_equal 123
  end

  it 'considers a zero integer in expression result as true' do
    0.ifelse(->{ 123 }, ->{ 456 }).must_equal 123
  end

  it 'evaluates subsequent elsif statements and execute body of first matching' do
    false.ifelse(->{ 123 }, ->{ false.ifelse ->{ 234 }, ->{ true.ifelse ->{ 345 }, ->{ true.if { 456 } } } }).must_equal 345
  end

  it 'evaluates else-body if no if/elsif statements match' do
    false.ifelse(->{ 123 }, ->{ false.ifelse ->{ 234 }, ->{ false.ifelse ->{ 345 }, ->{ 456 } } }).must_equal 456
  end
end
