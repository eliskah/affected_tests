# frozen_string_literal: true

RSpec.configure do |config|
  config.prepend_before(:each) do
    AffectedTests.start_trace
  end

  config.append_after(:each) do
    AffectedTests.stop_trace
    target_spec = self.class.declaration_locations.last[0]
    unless target_spec.end_with?("_spec.rb")
      if parent = self.class.module_parents.detect { |p| p.try(:declaration_locations) }
        target_spec = parent.declaration_locations.first[0]
      end
    end
    AffectedTests.checkpoint(target_spec)
  end

  config.after(:suite) do
    AffectedTests.dump
  end
end
