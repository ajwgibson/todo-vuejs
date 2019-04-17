require 'rails_helper'

RSpec.describe Todo, type: :model do

  # Always start with a valid factory...
  it 'has a valid factory' do 
    expect(FactoryBot.build(:todo)).to be_valid 
  end
  
  # Validation
  it { should validate_presence_of(:title) }

end
