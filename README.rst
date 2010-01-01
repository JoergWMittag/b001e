=======
 B001e
=======
---------------------------------------------------------------------------
A message-sending based re-implementation of Boolean operators in pure Ruby
---------------------------------------------------------------------------

.. admonition:: Abstract

	B001e_ is a message-sending based re-implementation of the 
	Boolean operators ``and``, ``or`` and ``not`` and the Boolean 
	expressions ``if`` and ``unless`` in pure Ruby. 
	Lazy Evaluation / Short-circuiting is achieved through the use 
	of blocks and lambda expressions.

.. _B001e: https://JoergWMittag.GitHub.Com/b001e/

.. contents::

What
====

This library contains sample re-implementations of the Boolean 
operators ``and``, ``or`` and ``not`` and the Boolean expressions 
``if`` and ``unless``, in pure Ruby. The style is heavily 
inspired by Smalltalk_ and its relatives: the operators become 
messages that take block parameters and are sent to the 
conditionals.

Operator / keyword style::

	if c1 && c2
	  t
	elsif c3
	  ei
	else
	  e
	end

becomes::

	c1.and { c2 }.ifelse ->{ t }, ->{ c3.ifelse ->{ ei }, ->{ e } }

.. _Smalltalk: http://Smalltalk.Org/

Why
===

Every so often, there is a discussion on either the Ruby-Talk_ or 
Ruby-Core_ mailinglists, whether the number of operators that are 
not backed by methods should be reduced. In Ruby 1.9, ``!`` and 
``!=`` have already become methods, but ``and`` and ``or`` are 
still builtin operators and ``if`` and ``unless`` still builtin 
keywords.

One argument that is sometimes brought up is that because of the 
short-circuiting nature of those operators, implementing them as 
methods is impossible or at least hard. I just wanted to see 
*how* hard it really is!

.. _Ruby-Talk: http://Ruby-Forum.Com/forum/4/
.. _Ruby-Core: http://Ruby-Forum.Com/forum/14/

How
===

All the operators become methods. The logic is achieved through 
polymorphism: basically, ``NilClass`` and ``FalseClass`` get one 
set of implementations, ``Object`` gets the opposite set.

Lazy Evaluation is achieved with blocks: if a block is not 
supposed to be evaluated, it is simply never ``yield``\ ed to.

Where
=====

At `GitHub <https://GitHub.Com/JoergWMittag/B001e/>`_, of course!

Installation
============

::

	gem install b001e

Usage
=====

::

	require 'b001e'

	true.and { nil.or { 42 } }.if { puts "It's true!" }
	# Equivalent to: if true && (nil || 42) then puts "It's true!" end

	false.ifelse ->{ puts "You'll never see this." }, ->{ puts 'But this!' }
	# Equivalent to: if false then puts "You'll never see this." else puts 'But this!' end

Acknowledgements
================

Style
-----

The API style is heavily influenced by Smalltalk_.

Implementation
--------------

The implementation is literally textbook: every introductory CS 
text should have it.

Specs
-----

The Specs were directly lifted from the RubySpec_ project.

.. _RubySpec: http://RubySpec.Org/

License
=======

My original work is licensed under the `MIT X11 License`_.

.. include:: LICENSE.txt
   :literal:

The `RubySpec license`_ is also MIT X11.

.. include:: spec/LICENSE.txt
   :literal:

.. _MIT X11 License:  https://GitHub.Com/JoergWMittag/B001e/tree/master/LICENSE.txt
.. _RubySpec license: https://GitHub.Com/RubySpec/RubySpec/tree/master/LICENSE
