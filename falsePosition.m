function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxit)
%Uses false position method to approximate the root of a given function
%
%Inputs: func-name of the function you wish to find the roots of
%        xl-the lower bracket 
%        xu-the upeer bracket
%        es-Stoping criterion in %, defaults to .0001%
%        maxit-maximum iterations performed, defaults to 200
%
%Outputs: root-the approximated root of the function
%         fx-the actual function value at the approximated root
%         (should be near zero)
%         ea-actual approximate error in %(ea<es unless maxit is reached)
%         iter-number of iterations performed

%error checks
if nargin<3
    error('you must have at least 3 inputs');
end
if func(xl)*func(xu)>0
    error('the interval does not contain a sign change');
end
%defulats for optional inputs
if nargin<4
    es=.0001;
    maxit=200;
end
if nargin<5
    maxit=200;
end
iter=0;
ea=100;
xr=xl;
%performing the flase position method until the stopping criterion is
%reached or the maximum number of iterations is reached
while ea > es && iter < maxit
    xrlast=xr;
    xr=xu-(func(xu)*(xl-xu))/(func(xl)-func(xu));
    iter=iter+1;
    ea=abs((xr-xrlast)/xr)*100;
    signtest=func(xl)*func(xr);
    if signtest<0
        xu=xr;
    elseif signtest>0
        xl=xr;
    else 
        ea=0;
    end
end
root=xr;
fx=func(xr);
%display the results to the user
fprintf('The approximate root is %f\n',root);
fprintf('The true value of the funtion at this root is %f\n',fx);
fprintf('The approximate error is %f\n',ea);
fprintf('The number of iterations performed was %f\n\n',iter);
end
        
        
   
    



    