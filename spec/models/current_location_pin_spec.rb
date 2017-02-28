require 'rails_helper'

RSpec.describe CurrentLocationPin, type: :model do
  context "validations" do
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
  end
end
