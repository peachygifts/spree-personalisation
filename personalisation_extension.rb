class PersonalisationExtension < Spree::Extension
  version "0.1"
  description "Allow users to enter text information to personalise a product"
  url "http://"
  
  def activate
    Variant.additional_fields += [ :name => 'Personalisation Options']
    
    
    Order.class_eval do
      alias :defaultcontains? :contains?
      def contains?(variant)
         defaultcontains?(variant) unless variant.product.personalisation_options
      end
    end
  end
end
