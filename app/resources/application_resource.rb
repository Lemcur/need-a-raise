# frozen_string_literal: true

class ApplicationResource < JSONAPI::Resource
  abstract

  def self.associations
    primary_relationships.map { |hash| hash[:relation_name] }
      .sort
  end

  def self.primary_relationships
    relationships_array = _relationships.values.map do |association|
      {
        relation_name: association.instance_variable_get(:@relation_name),
        class_name: association.options[:class_name],
      }
    end
    relationships_array.delete_if { |association| association[:relation_name].match?(/.+able/) }
  end
end
