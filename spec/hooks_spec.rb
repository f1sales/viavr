require 'ostruct'

RSpec.describe F1SalesCustom::Hooks::Lead do
  context 'when come from Autoforce' do
    let(:lead) do
      lead = OpenStruct.new
      lead.source = source
      lead.product = product

      lead
    end

    let(:source) do
      source = OpenStruct.new
      source.name = 'Autoforce'

      source
    end

    let(:product) do
      product = OpenStruct.new
      product.name = nil

      product
    end

    let(:switch_source) { described_class.switch_source(lead) }

    context 'when product is Peças e Acessórios' do
      before { product.name = 'Hyundai Peças e Acessórios' }

      it 'return nil source' do
        expect(switch_source).to be_nil
      end
    end

    context 'when product is Hyundai Trabalhe Conosco' do
      before { product.name = 'Hyundai Trabalhe Conosco' }

      it 'return nil source' do
        expect(switch_source).to be_nil
      end
    end
  end
end
