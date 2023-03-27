# frozen_string_literal: true

require_relative 'viavr/version'
require 'f1sales_custom/parser'
require 'f1sales_custom/source'
require 'f1sales_custom/hooks'
require 'byebug'

module Viavr
  class Error < StandardError; end

  class F1SalesCustom::Hooks::Lead
    def self.switch_source(lead)
      product_name = lead.product.name.downcase || ''

      return nil if product_name['peças e acessórios']

      return nil if product_name['trabalhe conosco']

      lead.source.name
    end
  end
end
