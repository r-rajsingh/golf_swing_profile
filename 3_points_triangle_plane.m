
function [b]= triangle(p1, p2, p3)


h=patch('Faces',1:3,'Vertices',[p1;p2;p3 ]); 
set(h,'FaceColor','r','EdgeColor','k','LineWidth',0.4,'FaceAlpha',0.9 ) 
%axis equal vis3d 
view([100 100]) 
xlabel('x','FontSize',35 )    
ylabel('y','FontSize',35 )  
zlabel('z','FontSize',35 )

end