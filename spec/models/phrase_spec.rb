require 'rails_helper'

describe Phrase, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
