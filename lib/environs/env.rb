require 'environs/missing_env_var_error'

class Env
  class << self
    def method_missing(method, *args, &block)
      key = method.to_s.upcase
      key.match(/\w+/) ? env_key(key, args) : super
    end

    private

    def env_key(key, nil_allowance)
      value = ENV[key]
      value.nil? ? key_not_found(nil_allowance, key) : value
    end

    def key_not_found(potential_hash, key)
      hash = potential_hash.reduce({}, :merge)
      if hash.fetch(:allow_nil) == true
        nil
      else
        raise MissingEnvVarError, "The #{key} environment variable is not set."
      end
    end
  end
end
