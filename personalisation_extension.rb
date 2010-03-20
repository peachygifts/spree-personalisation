class PersonalisationExtension < Spree::Extension
  version "0.1"
  description "Allow users to enter text information to personalise a product"
  url "http://"
  
  def activate

    Product.class_eval do 
      has_many :personalisation_options, :dependent => :destroy
    end
    
    Variant.additional_fields += [ {:name => 'Personalisable?', :only => [:product], :use => 'select', :value => lambda { |controller, field| [["No", false], ["Yes", true]]  } } ]    
    
    Order.class_eval do
      alias :defaultcontains? :contains?
      def contains?(variant)
         defaultcontains?(variant) unless variant.product.personalisable?
      end
    end
  end
end
