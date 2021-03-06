% 
% cptasks - A MATLAB(R) implementation of schedulability tests for
% conditional and parallel tasks
%
% Copyright (C) 2014-2015  
% ReTiS Lab - Scuola Superiore Sant'Anna - Pisa (Italy)
%
% cptasks is free software; you can redistribute it
% and/or modify it under the terms of the GNU General Public License
% version 2 as published by the Free Software Foundation, 
% (with a special exception described below).
%
% Linking this code statically or dynamically with other modules is
% making a combined work based on this code.  Thus, the terms and
% conditions of the GNU General Public License cover the whole
% combination.
%
% cptasks is distributed in the hope that it will be
% useful, but WITHOUT ANY WARRANTY; without even the implied warranty
% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License version 2 for more details.
%
% You should have received a copy of the GNU General Public License
% version 2 along with cptasks; if not, write to the
% Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
% Boston, MA 02110-1301 USA.
%
%
% Author: 2015 Alessandra Melani
%

function interf = getInterfFJ(j, k, L, taskGSSG)
% used for the test by Maia et al.

    global task;

    q1 = L - taskGSSG(j).len + 1;
    q2 = 0;
    
    for i = 1 : length(taskGSSG(j).GSSGhl)
        if taskGSSG(j).GSSGhl(i, 2) >= k
            q2 = q2 + taskGSSG(j).GSSGhl(i, 1);
        end
    end    
       
    q2 = q2 * (floor((L + taskGSSG(j).R - taskGSSG(j).len)/ task(j).T) + 1);
        
    interf = min(q1, q2);
end