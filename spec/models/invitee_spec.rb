require 'rails_helper'

RSpec.describe Invitee do
  describe 'associations' do
    it {should belong_to(:viewing_party)}
    it {should belong_to(:user)}
  end
end