
class PasswordValidatorService
  def self.validate(password)
    return false unless password.length >= 9 

    return false unless password.match?(/\d/) && # Ao menos um número
                        password.match?(/[a-z]/) && # Ao menos uma letra minúscula
                        password.match?(/[A-Z]/) &&  # Ao menos uma letra maiúscula
                        password.match?(/[!@#$%^&*()-+]/) # Ao menos um caractere especial
    return false if password.chars.uniq.length != password.length # Não pode ter caracteres repetidos
    
    true
  end
end
