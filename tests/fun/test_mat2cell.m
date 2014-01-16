% Test file for fun/mat2cell.m

function pass = test_mat2cell(pref)

if ( nargin < 2 )
    pref = chebpref();
end

for n = 1:1 %[TODO]: unbndfun
    if ( n == 1 )
        testclass = bndfun();
        dom = [-2 7];
    else 
        testclass = unbndfun();
    end

    f = testclass.make(@(x) [sin(x) cos(x) exp(x) x], dom, [], [], pref);
    g = testclass.make(@(x) sin(x), dom, [], [], pref);
    h = testclass.make(@(x) [cos(x) exp(x)], dom, [], [], pref);
    l = testclass.make(@(x) x, dom, [], [], pref);
    
    % test full arguments
    F = mat2cell(f, 1, [1 2 1]);
    pass(n, 1) = ~isempty(F{1}) && normest(F{1} - g) < get(g, 'epslevel')*get(g, 'vscale');
    pass(n, 2) = ~isempty(F{2}) && normest(F{2} - h) < max(get(h, 'epslevel')*get(h, 'vscale'));
    pass(n, 3) = ~isempty(F{3}) && normest(F{3} - l) < get(l, 'epslevel')*get(l, 'vscale');
    
    % test two arguments
    F = mat2cell(f, [1 2 1]);
    pass(n, 4) = ~isempty(F{1}) && normest(F{1} - g) < get(g, 'epslevel')*get(g, 'vscale');
    pass(n, 5) = ~isempty(F{2}) && normest(F{2} - h) < max(get(h, 'epslevel')*get(h, 'vscale'));
    pass(n, 6) = ~isempty(F{3}) && normest(F{3} - l) < get(l, 'epslevel')*get(l, 'vscale');
end

end