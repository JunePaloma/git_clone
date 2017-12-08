require 'rails_helper'

 describe User do
  context  "initialize" do
    it "exists with valid data" do
      login = "TestUser",
      url = "/github_user",
      uid = "222",
      avatar_url = "https://static.pexels.com/photos/356378/pexels-photo-356378.jpeg"

    user = User.new(login, url, uid, avatar_url)
    expect(user).to be_a(User)
    expect(user.login).to eq("TestUser")
    expect(user.uid).to eq ("222")
    expect(user.uid).to eq ("/github_user")
    expect(user.avatar_url).to eq("https://static.pexels.com/photos/356378/pexels-photo-356378.jpeg")
   end
 end

 # context "class methods" do
 #   context ".all_by_state" do
 #     it "returns a list of members with a valid state" do
 #       members = Member.all_by_state("CO")
 #       member = members.first
 #
 #       expect(members.count).to eq(7)
 #       expect(member).to be_a(Member)
 #     end
 #   end
 #  end
end
