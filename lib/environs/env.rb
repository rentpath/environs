require 'environs/missing_env_var_error'

class Env
  class << self
    def method_missing(method, *args, &block)
      key = method.to_s.upcase
      key.match(/\w+/) ? env_key(key, *args) : super
    end

    private

    def env_key(key, nil_allowance = {})
      ENV.fetch(key) { |k| key_not_found(nil_allowance, key) }
    end

    def key_not_found(nil_allowance, key)
      nil_allowance[:allow_nil] ? nil : env_var_error(key)
    end

    def env_var_error(key)
      raise MissingEnvVarError, "The #{key} environment variable is not set."
    end
  end
end
