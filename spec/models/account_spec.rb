
require 'rails_helper'

describe Account do
  it { should have_many(:images) }

  it 'confirms the user_name' do
    account = FactoryBot.create(:account)
    expect(account.name).to eq 'Michael Bluth'
  end

end
