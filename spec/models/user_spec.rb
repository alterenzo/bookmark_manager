require_relative '../../app/models/user'

describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: '1234', password_confirmation: '1234')
  end

  it 'authenticates when a valid email and password given' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate with a wrong password or username' do
      expect(User.authenticate(user.email, '4321')).to eq nil
  end

  it 'saves a password recovery token when we generate a token' do
    expect{ user.generate_token }.to change{ user.password_token }
  end


end
