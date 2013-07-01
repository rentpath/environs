require 'environs/missing_env_var_error'

class Env
  class << self
    def method_missing(method, *args, &block)
        key = method.to_s.upcase
      if key.match(/\w+/)
        ENV[key] || key_not_found_response(args.first, key)
      else
        super
      end
    end

    def key_not_found_response(potential_hash, key)
      if potential_hash.respond_to?(:fetch) && potential_hash.fetch(:allow_nil)
        nil
      else
        raise MissingEnvVarError, "The #{key} environment variable is not set."
      end
    end
  end
end
