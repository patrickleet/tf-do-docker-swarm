libstorage:
  service: dobs
  server:
    services:
      dobs:
        driver: dobs
        dobs:
          token: ${dobs_token}
          region: ${swarm_region}
          tag: rexray
          convertUnderscores: true
          statusMaxAttempts: 10
          statusInitialDelay: 100ms
