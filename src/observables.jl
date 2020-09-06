trigger(observable) = observable[] = observable[]

"""
Trigger the function f on the observable obs (with itself as value) on any update of the observables.
"""
function bind_observables!(f, obs, observables)
    trigger_obs(x) = trigger(obs)
    on(f, obs)
    on.(Ref(trigger_obs), observables)
    
end

