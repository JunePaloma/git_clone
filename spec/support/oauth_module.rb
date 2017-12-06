module OauthModule
  def mock_auth_hash #move to module in support folder
    OmniAuth.config.mock_auth[:github] = {
      'info' => {
        'uid' => '26794850',
        'nickname' => 'JunePaloma',
        'name' => 'Kali Borkoski',
        # 'email' => 'nil',
        # 'image' => 'https://static.pexels.com/photos/356378/pexels-photo-356378.jpeg'
      },
      'credentials' => {
        'token' => ENV["GITHUB_USER_TEST_TOKEN"]
      }
    }
  end
end
