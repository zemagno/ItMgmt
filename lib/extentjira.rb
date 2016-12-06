require 'jira'  
module JIRA

  class Client
    def IssueLink # :nodoc:
      JIRA::Resource::IssueLinkFactory.new(self)
    end
  end
  module Resource

    class IssueLinkFactory < JIRA::BaseFactory # :nodoc:
    end

    class IssueLink < JIRA::Base ; end

  end
  class Base
     def self.endpoint_name
       epname = self.name.split('::').last.downcase
       epname = "issueLink" if epname=="issuelink"
       epname
     end
   end
end

# consumer key: 5155c68fb50b85d89ce812d1884dbfa5
# 
# -----BEGIN CERTIFICATE-----
# MIICrDCCAhWgAwIBAgIJAPrBFv9Q3iBFMA0GCSqGSIb3DQEBBQUAMG8xCzAJBgNV
# BAYTAlVTMREwDwYDVQQIDAhOZXcgWW9yazERMA8GA1UEBwwITmV3IFlvcmsxHjAc
# BgNVBAoMFVNVTU8gSGVhdnkgSW5kdXN0cmllczEaMBgGA1UEAwwRd3d3LnN1bW9o
# ZWF2eS5jb20wHhcNMTQwODI4MTUwMDEwWhcNMTQwOTI3MTUwMDEwWjBvMQswCQYD
# VQQGEwJVUzERMA8GA1UECAwITmV3IFlvcmsxETAPBgNVBAcMCE5ldyBZb3JrMR4w
# HAYDVQQKDBVTVU1PIEhlYXZ5IEluZHVzdHJpZXMxGjAYBgNVBAMMEXd3dy5zdW1v
# aGVhdnkuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCujhsflttXnQTO
# dqmtG4mNpIISc1uU4C+ZIyMW6kn3p4B9HxsrFhFQzULD+OLNIdAIsPIVgR81oWaH
# d4u1IdkC6g82RbGvHKaI8cb4QhNr/H67s/5USPVoOmVa9hs0rxck/db/bj9XuvLO
# W89XIi+6IFJX0xaPC5RILexm4jObIwIDAQABo1AwTjAdBgNVHQ4EFgQU+AGFI/bg
# REmy8FAjRrieXBu1DpIwHwYDVR0jBBgwFoAU+AGFI/bgREmy8FAjRrieXBu1DpIw
# DAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQCbXnsw7zQvIdEbEq1k0VcZ
# tSg/iVs2bllCioToZ8GpXyb8Tm2qbeDyuxzi+A9Dr+SGdXXi9lK8Pl/0I/yJ2q9N
# RhtHDMOGwzgXCg8yssEZCDsvz3k3tubwh+lCLm4R1bVZW5XENy1uaSUKmh4yKUQ0
# b6arKPXkxgxK5relr0SXCg==
# -----END CERTIFICATE-----




