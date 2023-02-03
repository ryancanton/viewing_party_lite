require 'rails_helper'

RSpec.describe 'Users Dashboard' do
  before :each do
    @user = User.create!(name: "John Cena", email: "John@email.com")
    @viewing_party1 = ViewingParty.create!(when: "11/21/2030 7:00", duration: 90, start_time: "7:00", movie_id: 550)
    @viewing_party2 = ViewingParty.create!(when: "11/21/2030 10:00", duration: 120, start_time: "7:00", movie_id: 550)
    Invitee.create!(user_id: @user.id, viewing_party_id: @viewing_party1.id, host: true)
    Invitee.create!(user_id: @user.id, viewing_party_id: @viewing_party2.id, host: true)
    visit user_dashboard_index_path(@user)
  end

  it 'contains a header' do
    expect(page).to have_content("#{@user.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button("Discover Movies")
  end

  it 'has a section that list the viewing parties' do
    within "div#viewing_party_#{@viewing_party1.id}" do
      expect(page).to have_content("Viewing Party #{@viewing_party1.id}")
    end

    within "div#viewing_party_#{@viewing_party2.id}" do
      expect(page).to have_content("Viewing Party #{@viewing_party2.id}")
    end
  end
end
# As a user,
# When I visit a user dashboard,
# I should see the viewing parties that the user has been invited to with the following details:

# Movie Image
# Movie Title, which links to the movie show page
# Date and Time of Event
# who is hosting the event
# list of users invited, with my name in bold
# I should also see the viewing parties that the user has created with the following details:

# Movie Image
# Movie Title, which links to the movie show page
# Date and Time of Event
# That I am the host of the party
# List of friends invited to the viewing party