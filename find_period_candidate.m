

function candidate=find_period_candidate(T)


rounded_T=round(T);
rounded_T(isinf(rounded_T))=[];
L=length(rounded_T);

if L>=2    
    lcm_candidate=lcm(rounded_T(1),rounded_T(2));
    for i=3:L
        lcm_candidate=lcm(lcm_candidate,rounded_T(i));
    end

    candidate=lcm_candidate;
elseif L==1
    candidate=rounded_T;
else
    candidate=0;
end