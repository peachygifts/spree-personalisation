class PersonalisationExtension < Spree::Extension
  version "0.2"
  description "Allow users to enter text information to personalise a product"
  url "http://github.com/peachygifts/spree-personalisation"
  
  def activate
    Admin::BaseController.class_eval do
      helper :PersonalisationOptions
    end

    Product.class_eval do 
      has_many :personalisation_options, :dependent => :destroy
      accepts_nested_attributes_for :personalisation_options, :allow_destroy => true
    end
    
    LineItem.class_eval do 
      has_many :personalisation_details, :dependent => :destroy
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
