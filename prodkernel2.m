function K = prodkernel(rho, mu1, mu2, variances1, variances2)
% USAGE: K = prodkernel(rho, mu1, mu2, SIGMA1, SIGMA2)
% rho - scalar
% mu1, mu2 = Dx1 col vectors
% SIGMA1, SIGMA2 = DxD covariance matrices

    D = 8565;
%     sig1 = inv(SIGMA1);
%     sig2 = inv(SIGMA2);
%     size(variances1), size(variances2)
    sig1 = diag(1./variances1); %inverse of diagonal matrix
    sig2 = diag(1./variances2);
%     size(sig1), size(sig2)
    mu12 = mu1+mu2;
    norm(mu12);
%     SIGMA12 = sig1 + sig2;
    variances12 = (1./variances1) + (1./variances2);
    norm(variances12);
    sigma12 = diag(1./variances12);
%     exponent = -(rho/2)*(mu1'*(sig1*mu1)+mu2'*(sig2*mu2) - mu12'*(sigma12*mu12));
%     coeff = (2*pi)^((1-2*rho)*(D/2))*rho^(-D/2)*prod(variances12)^(-0.5)*prod(variances1)^(-rho/2)*prod(variances2)^(-rho/2);
%     exponent = -(rho/2)*(mu1'*mu1+mu2'*mu2 - mu12'*mu12);
%     coeff = (2*pi)^((1-2*rho)*(D/2))*rho^(-D/2);

%     K = coeff * exp(exponent);
    K = ((1-2*rho)*(D/2))*log(2*pi)+(-D/2)*log(2*rho)-(rho/4)*norm(mu1-mu2)^2; %LOG scale

end