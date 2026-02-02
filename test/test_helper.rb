require 'rubygems'
require 'bundler'
require 'minitest/autorun'
require 'ws_client'
require 'eventmachine'
require 'websocket-eventmachine-server'
require_relative 'echo_server'

$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
