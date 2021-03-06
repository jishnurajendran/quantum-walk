%DQWL_POSITION_TRANSFORMATION  Calculates the position transformation of a 
%                              discrete-time quantum walk on a line.
%
%   DQWL_POSITION_TRANSFORMATION(n) Calculates the position transformation 
%                    of a discrete-time quantum walk on a line.
%       n:           the number of steps of the quantum walk.
%       return:      a 2d * 2d matrix representing the position 
%                    transformation matrix of the quantum walk, where 
%                    d = 2 * n + 1 is the dimension of the position state.

%   Copyright 2013-2015, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_p = dqwl_position_transformation(n)
    if n < 1
        error('ERROR: number of steps must be greater than one');
    end
    c_0 = qubit(0);                         % the coin state |0>
    c_1 = qubit(1);                         % the coin state |1>
    d = 2 * n + 1;                          % the dimension of position state
    M_p = zeros(2*d);                       % calculate the position transformation
    % M_p = \sum_{k=1}^{d}(|k-1,0> <k,0| + |k+1,1> <k,1|)
    for k = 1 : d                           
        p_o = basis(d, k);                  % the current position state |k>
        p_l = basis(d, k - 1);              % the position state |k-1>
        p_r = basis(d, k + 1);              % the position state |k+1> 
        M_p = M_p + ketbra(kron(p_l, c_0), kron(p_o, c_0)) ...
                  + ketbra(kron(p_r, c_1), kron(p_o, c_1));        
    end      
end       