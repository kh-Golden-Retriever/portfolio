class User < ApplicationRecord
  authenticates_with_sorcery!
  
  enum role: {0:user, 1:admin}
end
