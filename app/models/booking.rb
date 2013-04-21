class Booking
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  attr_accessor :delegate_name, :delegate_yomi, :delegate_address, :delegate_phone, :members

  def persisted?; false; end

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def attributes=(attributes = {})
    if attributes
      attributes.each do |name, value|
        send "#{name}=", value
      end
    end
  end

  def attributes
    Hash[instance_variable_names.map{|v| [v[1..-1], instance_variable_get(v)]}]
  end
end
