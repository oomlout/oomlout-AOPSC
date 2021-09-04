m="";
w=3;
h=3;
extra="NONE";
s="3DPR";
$fn = 25;
OS=15;

oi("cube",width=10,height=10,depth=10);




module OPSCbuild(shift=100){
    if(i==11){
        if(o=="LAZE"){
            translate([shift*0,0,0]){
                projection(){
                    draw1();
                }
            }
            translate([shift*1,0,0]){
                projection(){
                    draw2();
                }
            }
            translate([shift*2,0,0]){
                projection(){
                    draw3();
                }
            }
            translate([shift*3,0,0]){
                projection(){
                    draw4();
                }
            }
            translate([shift*4,0,0]){
                projection(){
                    draw5();
                }
            }
            translate([shift*5,0,0]){
                projection(){
                    draw6();
                }
            }
            translate([shift*6,0,0]){
                projection(){
                    draw7();
                }
            }
            translate([shift*7,0,0]){
                projection(){
                    draw8();
                }
            }
            translate([shift*8,0,0]){
                projection(){
                    draw9();
                }
            }
            translate([shift*9,0,0]){
                projection(){
                    draw10();
                }
            }
        }else{
            translate([shift*0,0,0]){
                draw1();
            }
            translate([shift*1,0,0]){
                draw2();
            }
            translate([shift*2,0,0]){
                draw3();
            }
            translate([shift*3,0,0]){
                draw4();
            }
            translate([shift*4,0,0]){
                draw5();
            }
            translate([shift*5,0,0]){
                draw6();
            }
            translate([shift*6,0,0]){
                draw7();
            }
            translate([shift*7,0,0]){
                draw8();
            }
            translate([shift*8,0,0]){
                draw9();
            }
            translate([shift*9,0,0]){
                draw10();
            }        
        }
    }
    if(i==1){
        if(o=="LAZE"){
            projection(){
                draw1();
            }
        }else{  
                draw1();  
        }
    }
    if(i==2){
        if(o=="LAZE"){
            projection(){
                draw2();
            }
        }else{  
                draw2();  
        }
    }
    if(i==3){
        if(o=="LAZE"){
            projection(){
                draw3();
            }
        }else{  
                draw3();  
        }
    }
    if(i==4){
        if(o=="LAZE"){
            projection(){
                draw4();
            }
        }else{  
                draw4();  
        }
    }
    if(i==5){
        if(o=="LAZE"){
            projection(){
                draw5();
            }
        }else{  
                draw5();  
        }
    }
    if(i==6){
        if(o=="LAZE"){
            projection(){
                draw6();
            }
        }else{  
                draw6();  
        }
    }
    if(i==7){
        if(o=="LAZE"){
            projection(){
                draw7();
            }
        }else{  
                draw7();  
        }
    }
    if(i==8){
        if(o=="LAZE"){
            projection(){
                draw8();
            }
        }else{  
                draw8();  
        }
    }
    if(i==9){
        if(o=="LAZE"){
            projection(){
                draw9();
            }
        }else{  
                draw9();  
        }
    }
    if(i==10){
        if(o=="LAZE"){
            projection(){
                draw10();
            }
        }else{  
                draw10();  
        }
    }
}

 
module OPSCHole(rad){
    depth = 500;
    OPSCCylinder(rad,depth,z=depth/2);
}

module OPSCHoleRect(width,height){
    depth = 500;
    OPSCCube(width,height,depth=depth,z=depth/2);
}

module OPSCCylinder(rad,depth,x=0,y=0,z=0){
    translate([x,y,z-depth]){
        linear_extrude(depth){
            circle(rad);
        }
    }
}

module OPSCCone(rad,rad2,depth,x=0,y=0,z=0){
    echo("CONE");
    translate([x,y,z-depth/2]){
        cylinder(h=depth,r1=rad,r2=rad2,center=true);
    }
}

module OPSCSphere(rad,x=0,y=0,z=0){
    translate([x,y,z]){
        sphere(rad);
    }
}

module OPSCCube(width,height,depth,x=0,y=0,z=0){
    translate([x,y,z-depth]){
        linear_extrude(depth){
            square([width,height],true);
        }
    }
}

module OPSCCubeRounded(width,height,depth,rad=5,x=0,y=0,z=0){
    translate([x,y,z-depth]){
        linear_extrude(depth){
            if(rad==0){
                offset(r=5){
                    rad2=5;
                    square([width-rad2*2,height-rad2*2],true);
                }
            }else{                
                offset(r=rad){
                    square([width-rad*2,height-rad*2],true);
                }

                
            }
        }
    }
}

module OPSCTriangle(width,height,depth,ex="R"){
    if(ex == "L"){
        mirror([1,0,0]){
            translate([-width/2,-height/2,-depth]){
                points=[[0,0],[width,0],[0,height]];
                linear_extrude(depth){
                    polygon(points);
                }
            }
        }
    }else{
        mirror([0,0,0]){
            translate([-width/2,-height/2,-depth]){
                points=[[0,0],[width,0],[0,height]];
                linear_extrude(depth){
                    polygon(points);
                }
            }
        }
        
    }
    
}

module OPSCPolygon(sides=6,x=0,y=0,rad,depth,z=0){    
   translate([x,y,z-depth]){
       linear_extrude(depth){
           Polygon(N=sides,R=rad,h=0);
       }
   }
}

module OPSCStar(points=5,x=0,y=0,radI,radO,depth,z=0){    
   translate([x,y,z-depth]){
       linear_extrude(depth){
           Star(points=points,outer=radO,inner=radI);
       }
   }
}

module OPSCoobbBase(OOwidth,OOheight,depth=3,holes=true,color="gray"){
    
    cornerRad = 5;
    wid = OOBBspacing * OOwidth - 3;
    hei = OOBBspacing * OOheight - 3;
    x = wid/2 - cornerRad;
    y = hei/2 - cornerRad;
    difference(){
        color(color){
            hull(){    
                oi("cylinder",depth=depth,rad=cornerRad,x=x,y=y,color=color); 
                oi("cylinder",depth=depth,rad=cornerRad,x=-x,y=y,color=color); 
                oi("cylinder",depth=depth,rad=cornerRad,x=x,y=-y,color=color); 
                oi("cylinder",depth=depth,rad=cornerRad,x=-x,y=-y,color=color); 
            }
        }
        
        if(holes){
            for(width = [1:OOwidth]){
                for(height = [1:OOheight]){
                    OPSCoobbHole(OOwidth,OOheight,width,height);
                }
            }   
        }
    }
    
    
}

module OPSCoobbHole(OOwidth,OOheight,OOx,OOy){
    x = -OOBBspacing/2 + -(OOwidth * OOBBspacing / 2) + OOx * OOBBspacing;
    y = -OOBBspacing/2 + -(OOheight * OOBBspacing / 2) + OOy * OOBBspacing;
    oi("holeM6",x,y);
}//######  OPSC OpenSCAD Generation  ######
//########################################

    //OPENSCAD Variables

    //CORE
    OPSCSpacing = 15;
    
    //Not yet implemented
    OPSCfirstLayerLipOffset = 0.35;
    OPSCfirstLayerLipDepth = 0.2;
    
    
    OOBBspacing = 15;

    // HOLES
    OPSCHole = s=="3DPR" ? 6.5/2 : 6/2;

    
    
    holeM1 = s=="3DPR" ? 1.2/2 : 1/2;
    holeM12D = s=="3DPR" ? 1.4/2 : 1.2/2;
    holeM16D = s=="3DPR" ? 1.8/2 : 1.6/2;
    holeM2 = s=="3DPR" ? 2.3/2 : 2/2;
    holeM25D = s=="3DPR" ? 2.8/2 : 2.5/2;
    holeM3 = s=="3DPR" ? 3.4/2 : 3/2;
    holeM4 = s=="3DPR" ? 4.4/2 : 4/2;
    holeM5 = s=="3DPR" ? 5.4/2 : 5/2;
    holeM6 = s=="3DPR" ? 6.5/2 : 6/2;
    holeM7 = s=="3DPR" ? 7.5/2 : 7/2;
    holeM8 = s=="3DPR" ? 8.6/2 : 8/2;
    holeM9 = s=="3DPR" ? 9.6/2 : 9/2;
    holeM10 = s=="3DPR" ? 10.6/2 : 10/2;
    holeM11 = s=="3DPR" ? 11.6/2 : 11/2;
    holeM12 = s=="3DPR" ? 12.6/2 : 12/2;
    holeM13 = s=="3DPR" ? 13.6/2 : 13/2;
    holeM14 = s=="3DPR" ? 14.6/2 : 14/2;
    holeM15 = s=="3DPR" ? 15.6/2 : 15/2;
    holeM16 = s=="3DPR" ? 16.6/2 : 16/2;
    holeM17 = s=="3DPR" ? 17.6/2 : 17/2;
    holeM18 = s=="3DPR" ? 18.6/2 : 18/2;
    holeM19 = s=="3DPR" ? 19.6/2 : 19/2;
    holeM20 = s=="3DPR" ? 20.6/2 : 20/2;
    
    //  FASTENERS
    socketHeadM3 = s=="3DPR" ? 5.5/2 + 0.6 : 5.5/2;
    socketHeadM3Depth = s=="3DPR" ? 3 + 0.8 : 3;
        
        //countersunk
    countersunkM25DTop = s=="3DPR" ? 4.6/2+0.6 : 4.6/2;    
    countersunkM25DDepth = s=="3DPR" ? 1.5+0.2 : 1.5;    
    
    countersunkM3Top = s=="3DPR" ? 5.5/2+0.6 : 5.5/2;    
    countersunkM3Depth = s=="3DPR" ? 1.7+0.2 : 1.7;    

    // Bearings
        //606
    bearing606Big = s=="3DPR" ? 17.5/2 : 17/2;
    bearing606Little = s=="3DPR" ? 14.5/2 : 14/2;
    bearing606Depth = 6;

        //608
    bearing608Big = s=="3DPR" ? 22.5/2 : 22/2;
    bearing608Little = s=="3DPR" ? 19.5/2 : 19/2;
    bearing608Depth = 7;
    
    //6810 Bearing
    OPSCBearing6810Inside = s=="3DPR" ? (50/2-(0.15/2)) : 50/2;
    OPSCBearing6810Outside = s=="3DPR" ? 65/2-(0.2/2) : 65/2;
    OPSCBearing6810OutsideHold = s=="3DPR" ? 65/2+(0.6/2) : 65/2;

    OPSCBearing6810Little = 65/2-(3/2);
    OPSCBearing6810LittleInside =50/2+(3/2);

    // NUTS
        //M3
    OPSCNutM3Width = s=="3DPR" ? 7.028 : 6.351;
    
    OPSCNutM3WidthShortSideTrue = 5.5;    //5.5mm short side
    OPSCNutM3WidthShortSide3D = 6; //needs to be the long side // //6mm short side    
    OPSCNutM3WidthShortSide = s=="3DPR" ? OPSCNutM3WidthShortSide3D : OPSCNutM3WidthShortSideTrue;
    
    OPSCNutM3HeightTrue = 2.5;    //actually 4.85 extra for clearance
    OPSCNutM3Height3D = 2.5;    
    OPSCNutM3Height = s=="3DPR" ? OPSCNutM3Height3D : OPSCNutM3HeightTrue;
    
        //M6
    OPSCNutM6Width = s=="3DPR" ? 12.7 : 11.547;
    
    OPSCNutM6WidthShort = s=="3DPR" ? 11 : 10;
    
    OPSCNutM6Height = s=="3DPR" ? 5 : 5; //actually 4.85 extra for clearance
    
    //Tripod
    OSPCNutTripodWidth = s=="3DPR" ? 14 : 12.8;
    
    OSPCNutTripodHeight = s=="3DPR" ? 5.2 : 5.2;
    
 
function gv(name) =
    //OOBB spacings
    name=="OS"      ? OS :
    name=="OS1"     ? OS  :
    name=="OS2"     ? OS * 2 :
    name=="OS3"     ? OS * 3 :
    name=="OS4"     ? OS * 4 :
    name=="OS5"     ? OS * 5 :
    name=="OS6"     ? OS * 6 :
    name=="OS7"     ? OS * 7 :
    name=="OS8"     ? OS * 8 :
    name=="OS9"     ? OS * 9 :
    name=="OS10"     ? OS * 10 :
    //0.1" spacings
    name=="I011"     ? 2.54 * 1 :
    name=="I012"     ? 2.54 * 2 :
    name=="I013"     ? 2.54 * 3 :
    name=="I014"     ? 2.54 * 4 :
    name=="I015"     ? 2.54 * 5 :
    name=="I016"     ? 2.54 * 6 :
    name=="I017"     ? 2.54 * 7 :
    name=="I018"     ? 2.54 * 8 :
    name=="I019"     ? 2.54 * 9 :
    
    //GMOT-01
    name=="GMOT-01-WIDTH"      ? 65 :
    name=="GMOT-01-HEIGHT"     ? 22.5 :
    name=="GMOT-01-DEPTH"      ? 19 + 1.5 :
    name=="GMOT-01-HOLE1X"     ? 13.5 :
    name=="GMOT-01-HOLE1Y"     ? 0 :
    name=="GMOT-01-HOLE2X"     ? -20 :
    name=="GMOT-01-HOLE2Y"     ? 9 :
    name=="GMOT-01-HOLE3X"     ? -20 :
    name=="GMOT-01-HOLE3Y"     ? -9 :
    //NUT M3
    name=="NUTM3WIDTH"     ? OPSCNutM3Width :
    name=="NUTM3HEIGHT"     ? OPSCNutM3Height :
    name=="GMOT-01-HOLE3Y"     ? -9 :
    
    "ERROR";

    
//#########################################################################################
//#########################################################################################
//#########          INSERT ROUTINES


module oi(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    OPSCInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,rad2,color,alpha,OOwidth,OOheight,holes,negative);
}

module OPSCInsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    color(color,alpha){
        translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){
                    //////////////////    PRIMATIVES
                    
                    if(item=="cylinder"){
                        OPSCCylinder(rad=rad,depth=depth);
                    }
                    else if(item=="sphere"){
                        OPSCSphere(rad=rad);
                    } 
                    else if(item=="cone"){
                        OPSCCone(rad=rad,rad2=rad2,depth=depth);
                    } 
                    else if(item=="cube" || item=="rect" || item=="rectangle"){
                        OPSCCube(width=width,height=height,depth=depth);
                    }
                    else if(item=="triangle"){
                        OPSCTriangle(width=width,height=height,depth=depth,ex=ex);
                        }  
                    else if(item=="text"){
                        ht=0.15;
                        translate([0,0,-ht]){
                            linear_extrude(height=ht){
                                text(ex,size=height,font="DejaVu Sans Mono",halign="center",valign="center");
                            }
                        }                        
                    }
                    else if(item=="cubeClearance"){
                        OPSCCube(width=width,height=height,depth=depth);    
                        oi("hole",x=width/2,y=height/2,depth=depth,rad=rad);
                        oi("hole",x=width/2,y=-height/2,depth=depth,rad=rad);
                        oi("hole",x=-width/2,y=height/2,depth=depth,rad=rad);
                        oi("hole",x=-width/2,y=-    height/2,depth=depth,rad=rad);
                    } 
                    else if(item=="cubeRounded" || item=="rectRounded" || item=="rectangleRounded"){
                        OPSCCubeRounded(width=width,height=height,depth=depth,rad=rad);
                    } 
                    else if(item=="oobbBase"){
                        OPSCCubeRounded(width=(width*15)-3,height=(height*15)-3,depth=depth,rad=rad);
                    } 
                    else if(item=="oobbHole"){
                        OPSCInsert("hole",rad=holeM6,x=-(OOwidth*15/2)+((width-1)*15)+15/2,y=-(OOheight*15/2)+((height-1)*15)+15/2);
                    } 
                    else if(item=="oobbHoleClearance"){
                        OPSCInsert("hole",rad=12/2,x=((width-1)*15)+15/2,y=((height-1)*15)+15/2);
                    }                    
                    else if(item=="hole"){
                        OPSCHole(rad);
                    }
                    else if(item=="holeRect"){
                        OPSCHoleRect(width=width,height=height);
                    }                                    
                    //////////////////    OOBB
                    else if(item=="oobb"){
                        OPSCoobbBase(OOwidth,OOheight,holes=holes,depth=depth,color=color);
                    }
                    else if(item=="oobbSlot"){
                        oi("cube",width=3,height=6,depth=100,z=50);
                    }
                    else if(item=="oobbBoltHole" || item=="oobbBoltSocket" ){
                        oi("holeM6");
                        oi("oobbSlot",x=0,y=15);
                        oi("oobbSlot",x=0,y=-15);
                    }
                    else if(item=="oobbBoltPlug"){
                        echo(negative);
                        if(negative){
                            dep = 10;
                           
                            //if(rotZ==-90){
                                //bolt hole
                                oi("cube",x=1.5+6,y=0,width=13,height=6,depth=depth);
                                //nut hole
                                oi("cube",x=5+6,y=0,width=6,height=10,depth=depth);                                
                            //}//else{
                            //
                            //    //bolt hole
                            //    oi("cube",x=1.5,y=0,width=13,height=6,depth=depth);
                            //    //nut hole
                            //    oi("cube",x=5,y=0,width=6,height=10,depth=depth);                                
                            //}
                        }else{
                            oi("cube",x=0,y=15,width=3,height=6,depth=depth);
                            oi("cube",x=0,y=-15,width=3,height=6,depth=depth);                           
                        }
                    }
                    
                    else if(item=="plateOOBB"){
                        OPSCInsert("cubeRounded",width=(width*15)-3,height=(height*15)-3,depth=depth);
                    }
                    else if(item=="OPSCHole"){
                        rad=OPSCHole;
                        OPSCHole(rad);
                    }
                    else if(item=="OPSCHoleSlot"){
                        union(){
                            hull(){
                                OPSCInsert("OPSCHole",x=-3);
                                OPSCInsert("OPSCHole",x=3);
                            }
                        }
                        
                    }
                    //////////////////      HOLES
                    else if(item=="holeM1"){OPSCHole(holeM1);}
                    else if(item=="holeM12D"){OPSCHole(holeM12D);}
                    else if(item=="holeM16D"){OPSCHole(holeM16D);}
                    else if(item=="holeM2"){OPSCHole(holeM2);}
                    else if(item=="holeM25D"){OPSCHole(holeM25D);}
                    else if(item=="holeM3"){OPSCHole(holeM3);}
                    else if(item=="holeM4"){OPSCHole(holeM4);}
                    else if(item=="holeM5"){OPSCHole(holeM5);}
                    else if(item=="holeM6"){OPSCHole(holeM6);}
                    else if(item=="holeM7"){OPSCHole(holeM7);}
                    else if(item=="holeM8"){OPSCHole(holeM8);}
                    else if(item=="holeM9"){OPSCHole(holeM9);}
                    else if(item=="holeM10"){OPSCHole(holeM10);}
                    else if(item=="holeM11"){OPSCHole(holeM11);}
                    else if(item=="holeM12"){OPSCHole(holeM12);}
                    else if(item=="holeM13"){OPSCHole(holeM13);}
                    else if(item=="holeM14"){OPSCHole(holeM14);}
                    else if(item=="holeM15"){OPSCHole(holeM15);}
                    else if(item=="holeM16"){OPSCHole(holeM16);}
                    else if(item=="holeM17"){OPSCHole(holeM17);}
                    else if(item=="holeM18"){OPSCHole(holeM18);}
                    else if(item=="holeM19"){OPSCHole(holeM19);}
                    else if(item=="holeM20"){OPSCHole(holeM20);}
                    else if(item=="holeArray"){
                        for(r=[1:height]){
                            for(c=[1:width]){
                                oi("hole",rad=rad,x=-(width*ex)/2+c*ex-ex/2,y=-(height*ex)/2+r*ex-ex/2, color=color);
                            }
                        }
                    }
                    //////////////////      FASTENERS
                    
                    else if(item=="socketHeadM3"){
                        oi("holeM3");
                        oi("cylinder",rad=socketHeadM3,depth=socketHeadM3Depth,z=socketHeadM3Depth);
                    }else if(item=="countersunkM3"){
                        translate([0,0,-countersunkM3Depth]){
                            cylinder(h=countersunkM3Depth,r1=holeM3,r2=countersunkM3Top);
                        }
                    }else if(item=="countersunkM25D"){
                        translate([0,0,-countersunkM25DDepth]){
                            cylinder(h=countersunkM25DDepth,r1=holeM25D,r2=countersunkM25DTop);
                        }
                    }
                    //////////////////////  COUPLERS
                    else if(item=="couplerFlangeM5"){
                        rotate([0,0,45]){
                            OPSCInsert("holeM3",0,8);
                            OPSCInsert("holeM3",0,-8);
                            OPSCInsert("holeM3",8,0);
                            OPSCInsert("holeM3",-8,0);
                            OPSCInsert("holeM6",0,0);
                        }
                    }
                    //////////////////    BEARINGS
                    
                    else if(item=="bearing606"){
                            OPSCCylinder(bearing606Big,depth=6);
                            OPSCCylinder(bearing606Little);
                    }
                    else if(item=="bearing608"){
                            OPSCCylinder(bearing608Big,depth=7);
                            OPSCHole(bearing608Little);
                    }
                    else if(item=="Bearing6810"){
                            OPSCHole(OPSCBearing6810Outside,7,0);
                            OPSCHole(OPSCBearing6810Little,100,50);
                    }
                    
                    //////////////////    NUTS                    
                    
                    else if(item=="M3SocketHeadFullNut"){
                        OPSCInsert("M3SocketHeadFull",0,0,0,length=height);
                        OPSCInsert("M3NutCaptiveSingle",0,0,z=-height+OPSCNutM3Height);
                        
                    }
                    else if(item=="M3SocketHeadUpsideDown"){
                        top = OPSCm3SocketHeadHole;
                        bot = OPSCm3SocketHeadHole;
                        height = OPSCm3SocketHeadDepth;
                        OPSCCountersink3DComplete(0,0,top,bot,height,height);
                    }

                    else if(item=="M3NutCaptive" || item=="nutM3"){
                        if(depth == 0){
                            OPSCPolygon(6,0,0,OPSCNutM3Width/2,2,0);
                        }else{
                            OPSCPolygon(6,0,0,OPSCNutM3Width/2,depth,0);
                        }
                    }
                    else if(item=="M3NutClearance"){  ///clearnce for an m3 nut
                        translate([0,0,-height]){
                            linear_extrude(height){
                                circle(6.2/2);
                            }
                        }
                    }
                    else {
                        TAXAInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,color,alpha,OOwidth,OOheight,holes,negative);
                        OOBBInsert(item,x,y,z,ex,length,rotX,rotY,rotZ,width,height,depth,rad,color,alpha,OOwidth,OOheight,holes,negative);
                    
                  
                  
                }
            }
        }   
    }
}
//============================================================
// OpenSCAD
// Regular Convex Polygon Library
// Last Modified : 2015/10/28
// Source: https://www.thingiverse.com/thing:335968
//============================================================
/*

	Definition

	N = Number of Side N >=3
	A = apothem
		radius of inside circle
	R = circumradius
		Radius of outside circle
	S = Side
		Lenght of a side

	Build polygon with the Apothem :
	N and A is known
	Need to calculate S then R

	Build Polygon with Circumradius
	N and R known

	Build Polygon with Side
	N and S Known
	Need to calculate R and optionaly A

	TO DO
    Control result

	For more information :
	http://en.wikipedia.org/wiki/Regular_polygon

*/

//------------------------------------------------------------
//
//------------------------------------------------------------
//Demo();

//------------------------------------------------------------
// Demo
//------------------------------------------------------------
module Demo()
{
	inch = 25.4;	// 25.4mm
	// A = apothem - it's a RADIUS !
	// For a bolt of 4 inches spécify A=2*inch
	Polygon(N=6,A=2*inch,h=0);	// 4 inches radius Polygon
	//Polygon(N=7,A=49.8365,h=0);
	//Trigon(A=50,h=10);			// N=3
	//Dodecagon(A=50,h=0);			// N=12

    //rotate([0,0,360/7/2])
	//Nonagon(R=55.3144,h=10,debug=true);

	//Polygon(N=6,A=60,h=0,debug=false);
	//Polygon(N=6,A=60,h=5,debug=true);

    //Enneagon(A=50);
}


//------------------------------------------------------------
// Polygon : 
//------------------------------------------------------------
module Polygon(N=3,A=0,R=0,S=0,h=0,debug=false)
{
	N = ( N < 3 ? 3 : N );

	angle = 360/N;
	angleA = angle/2;

	if (debug)
	{
		echo("N = ", N);
		echo("A = ", A);
		echo("S = ", S);
		echo("R = ", R);
	}

	if ( A > 0 )		// if A assign R and S
	{
        S = 2 * A * tan(angleA);							// assign
		//R = (S/2) / sin(angleA);						// no assign ???
		R = ( A * tan(angleA) ) / sin(angleA);		// asign
		_Build_Polygon(N=N,R=R,h=h);
		if (debug)
		{
			echo("aN = ", N);
			echo("aA = ", A);
			echo("aS = ", S);
			echo("aR = ", R);
		}
	}
	else
	{
		if ( S > 0 )		// if S assign R and A
		{
			R = (S/2) / sin(angleA);			// assign
			A = S / ( 2 * tan(angleA) );		// assign
            _Build_Polygon(N=N,R=R,h=h);
			if (debug)
			{
				echo("sN = ", N);
				echo("sA = ", A);
				echo("sS = ", S);
				echo("sR = ", R);
			}
		}
		else
		{
			if ( R == 0 )		// default
			{
				S = 2 * R * sin(angleA);			// no assign ???
				A = S / ( 2 * tan(angleA) );		// no assign ???
				_Build_Polygon(N=N,h=h);
				if (debug)
				{
					echo("0N = ", N);
					echo("0A = ", A);
					echo("0S = ", S);
					echo("0R = ", R);
				}
			}
			else		// build with R
			{
				S = 2 * R * sin(angleA);
				A = S / ( 2 * tan(angleA) );			// no assign ???
				//A = R * ( sin(angleA) / tan(angleA) )	// no assign ???
				_Build_Polygon(N=N,R=R,h=h);
				if (debug)
				{
					echo("rN = ", N);
					echo("rA = ", A);
					echo("rS = ", S);
					echo("rR = ", R);
				}
			}
		}
	}

	if (debug)
	{
		echo("fN = ", N);
		echo("fA = ", A);
		echo("fS = ", S);
		echo("fR = ", R);
	}
}

//------------------------------------------------------------
// Build
//------------------------------------------------------------
module _Build_Polygon(N=3,R=1,h=0)
{
	if (h > 0)
	{
		// 3D primitive h>0
	}
	else
	{
		// 2D primitive h=0
        
	}
}

//------------------------------------------------------------
// Building lots from N=3, N=N+1
// http://en.wikipedia.org/wiki/Polygon
//------------------------------------------------------------

// 3 sides
module Trigon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=3,A=A,R=R,S=S,h=h,debug=debug);}

module Triangle(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=3,A=A,R=R,S=S,h=h,debug=debug);}

// 4 sides
module Tetragon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=4,A=A,R=R,S=S,h=h,debug=debug);}

module Quadrilateral(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=4,A=A,R=R,S=S,h=h,debug=debug);}

module Quadrangle(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=4,A=A,R=R,S=S,h=h,debug=debug);}

// 5 sides
module Pentagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=5,A=A,R=R,S=S,h=h,debug=debug);}

// 6 sides
module Hexagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=6,A=A,R=R,S=S,h=h,debug=debug);}

// 7 sides
module Heptagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=7,A=A,R=R,S=S,h=h,debug=debug);}

// 8 sides
module Octagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=8,A=A,R=R,S=S,h=h,debug=debug);}

// 9 sides
module Enneagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=9,A=A,R=R,S=S,h=h,debug=debug);}

module Nonagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=9,A=A,R=R,S=S,h=h,debug=debug);}

// 10 sides
module Decagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=10,A=A,R=R,S=S,h=h,debug=debug);}

// 11 sides
module Handecagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=11,A=A,R=R,S=S,h=h,debug=debug);}

// 12 sides
module Dodecagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=12,A=A,R=R,S=S,h=h,debug=debug);}

// ...

// 100 sides
module Hectogon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=100,A=A,R=R,S=S,h=h,debug=debug);}

//==EOF=======================================================
    
    
 
//from https://gist.github.com/anoved/9622826    
// points = number of points (minimum 3)
// outer  = radius to outer points
// inner  = radius to inner points
module Star(points, outer, inner) {
	
	// polar to cartesian: radius/angle to x/y
	function x(r, a) = r * cos(a);
	function y(r, a) = r * sin(a);
	
	// angular width of each pie slice of the star
	increment = 360/points;
	
	union() {
		for (p = [0 : points-1]) {
			
			// outer is outer point p
			// inner is inner point following p
			// next is next outer point following p

                    x_outer = x(outer, increment * p);
					y_outer = y(outer, increment * p);
					x_inner = x(inner, (increment * p) + (increment/2));
					y_inner = y(inner, (increment * p) + (increment/2));
					x_next  = x(outer, increment * (p+1));
					y_next  = y(outer, increment * (p+1)) ;
            		polygon(points = [[x_outer, y_outer], [x_inner, y_inner], [x_next, y_next], [0, 0]], paths  = [[0, 1, 2, 3]]);
			
		}
	}
}    

// For inserting TAXA items
// ex used for items with mounting screws to control height of countersunk screw heads
// rad used for extra clearance around items
module TAXAInsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    if(item == "hexIDHoles" || item=="led100wHoles"){
        holeSpacing = 34;
        oi("holeM3",x=-holeSpacing/2,y=-holeSpacing/2);
        oi("holeM3",x=holeSpacing/2,y=holeSpacing/2);
        oi("holeM3",x=-holeSpacing/2,y=holeSpacing/2);
        oi("holeM3",x=holeSpacing/2,y=-holeSpacing/2);
    }
    else if(item == "hexIDHole" || item=="pocketMagnifierHole"){
        oi("cube",width=80,height=43,depth=100,z=50);
    }
    else if(item == "hexIDbuttonM7" || item=="buttonM7"){
        oi("cylinder",rad=holeM7,depth=11,z=11);
        oi("cylinder",rad=holeM10+rad,depth=18,z=0);
    }
    else if(item == "hexIDbatteryAAASINGTH" || item=="batteryAAASINGTH"){
        oi("cube",width=51+rad,height=13+rad,depth=13+rad);
        oi("holeM2",x=22.5);
        oi("holeM2",x=-22.5);
        
    }
    
}module OLD02_OOBB_HL_SM_03_03_HOLDER(bearingSize){
	
    spacerHeight = 12;
	bearingHeight = bearingSize == 6803 ? 5 : 4;  //default to 6704
	totalHeight = spacerHeight + bearingHeight;
	capHeight = bearingHeight + 2;
    holderBaseHeight = 8;
    
        //side one
		translate([0,0,0]){
            difference(){
                OOBB_HL_SM_03_03_HOLDER_CAP(capHeight);
                OOBB_HL_SM_03_03_HOLDER_MAINHOLES(capHeight);
                OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(bearingSize, capHeight -2);
                OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(bearingSize, capHeight);
                //OOBB_HL_SM_03_03_HOLDER_SERVOBRACKETCLEARANCE();
                OOBBCube3DComplete(2*OOBBSpacing,3*OOBBSpacing,45,30,60,30);
            }
        }
        //side two
		translate([0,2,0]){  //for printing
        //translate([0,0,0]){    //for development
            difference(){
                OOBB_HL_SM_03_03_HOLDER_CAP(capHeight);
                OOBB_HL_SM_03_03_HOLDER_MAINHOLES(capHeight);
                OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(bearingSize, capHeight -2);
                OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(bearingSize, capHeight);
                //OOBB_HL_SM_03_03_HOLDER_SERVOBRACKETCLEARANCE();
                OOBBCube3DComplete(2*OOBBSpacing,1*OOBBSpacing,45,30,60,30);
            }
        }
        //holder base
        translate([0,50,capHeight-holderBaseHeight]){  //for printing
        //translate([0,0,-20]){    // fodevelopment
            difference(){
                OOBB_HL_SM_03_03_HOLDER_BASE(bearingSize, holderBaseHeight);
                OOBB_HL_SM_03_03_HOLDER_MAINHOLES(holderBaseHeight);
			}
        }
        
        
	  
}

module OLD02_OOBB_HL_SM_03_03_HOLDER_CAP(capHeight){
    difference(){
        union(){
            OOBBPLOutline3D(3,3,capHeight);
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
        }
        TOP = 3;
        RIGHT = 3;
        BOTTOM = 1;
        LEFT = 1;
        
        //RIGHT TOP
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",RIGHT,TOP,capHeight,height=4,rot=180);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",RIGHT*OOBBSpacing+1,TOP*OOBBSpacing,capHeight,height=4,rot=180);
        //LEFT TOP
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",LEFT,TOP,capHeight,height=4,rot=270);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",LEFT*OOBBSpacing-1,TOP*OOBBSpacing,capHeight,height=4,rot=270);
        //RIGHT BOTTOM
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",RIGHT,BOTTOM,capHeight,height=4,rot=90);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",RIGHT*OOBBSpacing+1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=90);
        //LEFT BOTTOM
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",LEFT,BOTTOM,capHeight,height=4,rot=0);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",LEFT*OOBBSpacing-1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=0);
    }
}

module OLD02_OOBB_HL_SM_03_03_HOLDER_BASE(bearingSize, holderBaseHeight){
    difference(){
        union(){
            OOBBPLOutline3D(3,3,holderBaseHeight);
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(3,3,holderBaseHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,holderBaseHeight);
            }
        }
        if(bearingSize == 6704){
            OOBBInsertItemCoord("Bearing6704Little",2,2,holderBaseHeight);    
        }else if(bearingSize == 6803){
            OOBBInsertItemCoord("Bearing6803Little",2,2,holderBaseHeight);    
        }
        OOBBInsertItemCoord("ServoMicroHole",2,2,height=holderBaseHeight-2);
        
           
		//Servo Low
    OOBBInsertItemMM("M3NutCaptive",2.333*OOBBSpacing,3*OOBBSpacing+2,ooZ=OOBBNutM3Height,height=20);      
    //Servo High
    OOBBInsertItemMM("M3NutCaptive",2.333*OOBBSpacing,1*OOBBSpacing-2,ooZ=OOBBNutM3Height,height=20);      
    //Base Low
    //OOBBInsertItemMM("M3NutCaptive",1.667*OOBBSpacing,1*OOBBSpacing-2,ooZ=OOBBNutM3Height,height=20);      
    //Base High
    //OOBBInsertItemMM("M3NutCaptive",1.667*OOBBSpacing,3*OOBBSpacing+2,ooZ=OOBBNutM3Height,height=20);
    
    
    //LEFT BOTTOM
    OOBBInsertItemMM("M3NutCaptive",1*OOBBSpacing-2,1.667*OOBBSpacing,ooZ=holderBaseHeight-2,height=20);
    //LEFT TOP
    OOBBInsertItemMM("M3NutCaptive",1*OOBBSpacing-2,2.33*OOBBSpacing,ooZ=holderBaseHeight-2,height=20);
    
    //RIGHT BOTTOM
    OOBBInsertItemMM("M3NutCaptive",3*OOBBSpacing+2,1.667*OOBBSpacing,ooZ=holderBaseHeight-2,height=20);
    //RIGHT TOP
    OOBBInsertItemMM("M3NutCaptive",3*OOBBSpacing+2,2.33*OOBBSpacing,ooZ=holderBaseHeight-2,height=20);
    	
    }
}


module OLD02_OOBB_HL_SM_03_03_HOLDER_MAINHOLES(totalHeight){
//holes
    OOBBHole3D(1,1);
    OOBBHole3D(1,3);
    OOBBHole3D(3,1);
    OOBBHole3D(3,3);
    //Servo Low
    OOBBInsertItemMM("M3Hole",2.333*OOBBSpacing,3*OOBBSpacing+2);      
    //Servo High
    OOBBInsertItemMM("M3Hole",2.333*OOBBSpacing,1*OOBBSpacing-2);      
    //Base Low
    OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,1*OOBBSpacing-2);      
    //Base High
    OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,3*OOBBSpacing+2);
    
    
    //LEFT BOTTOM
    OOBBInsertItemMM("M3Hole",1*OOBBSpacing-2,1.667*OOBBSpacing);
    //LEFT TOP
    OOBBInsertItemMM("M3Hole",1*OOBBSpacing-2,2.33*OOBBSpacing);
    
    //RIGHT BOTTOM
    OOBBInsertItemMM("M3Hole",3*OOBBSpacing+2,1.667*OOBBSpacing);
    //RIGHT TOP
    OOBBInsertItemMM("M3Hole",3*OOBBSpacing+2,2.33*OOBBSpacing);
    
}




module OLD02_OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(bearingSize,totalHeight){
    if(bearingSize == 6704){
        OOBBInsertItemCoord("Bearing6704Hold",2,2,totalHeight);    
    }else if(bearingSize == 6803){
        OOBBInsertItemCoord("Bearing6803Hold",2,2,totalHeight);    
    }
}


module OLD02_OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(bearingSize,capHeight){
    
    
    
    /*
    nutHeight = totalHeight-5; //the height the nut is inserted at
    nutGap = 3.5;  //the length of the extrusion (distance from bottom is nutHeight - nutGap)
    nutWindow = 0; //the height of the nut (nutgap - nutWindow is the height of the gap mistake not fixed.)
    */
    
    //captive m3 nuts 2.5
    
    
    //Servo Low
    //OOBBInsertItemMM90("M3NutCaptive",2.333*OOBBSpacing,1*OOBBSpacing-2,ooZ=nutHeight,height=nutGap);
    OOBBInsertItemMM("M3SocketHead",2.333*OOBBSpacing,3*OOBBSpacing+2,height=capHeight);      
      
    
    
    //Servo High
    //OOBBInsertItemMM90("M3NutCaptive",2.333*OOBBSpacing,3*OOBBSpacing+2,ooZ=nutHeight,height=nutGap);O
    OOBBInsertItemMM("M3SocketHead",2.333*OOBBSpacing,1*OOBBSpacing-2,height=capHeight);      
    
    
    //Base Low
    //OOBBInsertItemMM90("M3NutCaptive",1.667*OOBBSpacing,1*OOBBSpacing-2,ooZ=nutHeight,height=nutGap);
    OOBBInsertItemMM("M3NutCaptiveSingle",1.667*OOBBSpacing,1*OOBBSpacing-2,ooZ=capHeight);      
    OOBBInsertItemMM("M3NutCaptiveSingle",1.667*OOBBSpacing,1*OOBBSpacing-2,ooZ=capHeight-OOBBNutM3Height);      
    
    
    //Base High
    //OOBBInsertItemMM90("M3NutCaptive",1.667*OOBBSpacing,3*OOBBSpacing+2,ooZ=nutHeight,height=nutGap);
    OOBBInsertItemMM("M3NutCaptiveSingle",1.667*OOBBSpacing,3*OOBBSpacing+2,ooZ=capHeight);      
    OOBBInsertItemMM("M3NutCaptiveSingle",1.667*OOBBSpacing,3*OOBBSpacing+2,ooZ=capHeight-OOBBNutM3Height);      
    
    
    //LEFT BOTTOM
    OOBBInsertItemMM("M3SocketHead",1*OOBBSpacing-2,1.667*OOBBSpacing,height=capHeight);
    //LEFT TOP
    OOBBInsertItemMM("M3SocketHead",1*OOBBSpacing-2,2.33*OOBBSpacing,height=capHeight);
    
    //RIGHT BOTTOM
    OOBBInsertItemMM("M3SocketHead",3*OOBBSpacing+2,1.667*OOBBSpacing,height=capHeight);
    //RIGHT TOP
    OOBBInsertItemMM("M3SocketHead",3*OOBBSpacing+2,2.33*OOBBSpacing,height=capHeight);
    
 /*   
//LINKING SQUARES
    translate([OOBBSpacing*2.33,OOBBSpacing*0.5-1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    } 
    
    translate([OOBBSpacing*2.33,OOBBSpacing*3.5+1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    } 
    translate([OOBBSpacing*1.67,OOBBSpacing*0.5-1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    }
    translate([OOBBSpacing*1.67,OOBBSpacing*3.5+1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    }
*/

    
}




module OLD02_OOBB_HL_SM_03_03_HOLDER_SERVOBRACKETCLEARANCE(){
    //clearance hole (bigger than needs to be at the moment)
    OOBBInsertItemCoord("ServoMicroHole",2,2,height=10);
    
    
    //servo holder negative
    
    //servoHolderCutoutSize = DEFINED AT TOP
    
    //servoHolderExtraClearance = DEFINED AT TOP;
    translate([2*OOBBSpacing,2*OOBBSpacing,0]){
        translate([-5.35,0,0]){
            OOBBPLOutline3DComplete(39+servoHolderExtraClearance,21,servoHolderCutoutSize);
        }
        //piece with screw holes
        translate([5,0,0]){
            OOBBPLOutline3DComplete(11+servoHolderExtraClearance,42+servoHolderExtraClearance*2,servoHolderCutoutSize);
        }       
    }
}













module OLD01_OOBB_HL_SM_03_03_HOLDER(bearingSize){
	
    spacerHeight = 12;
	bearingHeight = bearingSize == 6803 ? 5 : 4;  //default to 6704
	totalHeight = spacerHeight + bearingHeight;
	
    union(){
		//extra block added to conceal servo
		translate([OOBBSpacing * 1-6, OOBBSpacing*2,8]){
			linear_extrude(2){
				square([2,16],true);
			}
		}
		difference(){
            OOBB_HL_SM_03_03_HOLDER_MAINPIECE(totalHeight);
			OOBB_HL_SM_03_03_HOLDER_MAINHOLES(totalHeight);
			OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(bearingSize, totalHeight);
			OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(bearingSize, totalHeight);
			OOBB_HL_SM_03_03_HOLDER_SERVOBRACKETCLEARANCE();
		}
	}  
}

module OLD01_OOBB_HL_SM_03_03_HOLDER_MAINPIECE(totalHeight){
    union(){
        OOBBPLOutline3D(3,3,totalHeight);
        //extra end bits to keep servo bracket from sticking out the end.
        translate([-1,0,0]){
            OOBBPLOutline3D(3,3,totalHeight);
        }
        translate([1,0,0]){
            OOBBPLOutline3D(3,3,totalHeight);
        }
    }
}

module OLD01_OOBB_HL_SM_03_03_HOLDER_MAINHOLES(totalHeight){
//holes
    OOBBHole3D(1,1);
    //extra clearance hole
    OOBBInsertItemCoord("M6BoltClearance",1,1,totalHeight,height=4);      
    OOBBHole3D(1,3);   
    OOBBInsertItemCoord("M6BoltClearance",1,3,totalHeight,height=4);
    OOBBHole3D(3,1);   
    OOBBInsertItemCoord("M6BoltClearance",3,1,totalHeight,height=4);
    OOBBHole3D(3,3);   
    OOBBInsertItemCoord("M6BoltClearance",3,3,totalHeight,height=4);
    
    //extra keepout FOR BOLTS (8 TWO FOR EACH CORNER)
    translate([OOBBSpacing*1,OOBBSpacing*1-3,totalHeight-4]){
        linear_extrude(4){
            square([13,13/2],true);
        }
    }  
    translate([OOBBSpacing*1-3.5,OOBBSpacing*1,totalHeight-4]){
        linear_extrude(4){
            square([13/2+0.5,13],true);
        }
    }
    
    translate([OOBBSpacing*3,OOBBSpacing*1-3,totalHeight-4]){
        linear_extrude(4){
            square([13,13/2],true);
        }
    }  
    translate([OOBBSpacing*3+3.5,OOBBSpacing*1,totalHeight-4]){
        linear_extrude(4){
            square([13/2+0.5,13],true);
        }
    }
    
    translate([OOBBSpacing*1,OOBBSpacing*3+3,totalHeight-4]){
        linear_extrude(4){
            square([13,13/2],true);
        }
    }  
    translate([OOBBSpacing*1-3.5,OOBBSpacing*3,totalHeight-4]){
        linear_extrude(4){
            square([13/2+0.5,13],true);
        }
    }
    
    translate([OOBBSpacing*3,OOBBSpacing*3+3,totalHeight-4]){
        linear_extrude(4){
            square([13,13/2],true);
        }
    }  
    translate([OOBBSpacing*3+3.5,OOBBSpacing*3,totalHeight-4]){
        linear_extrude(4){
            square([13/2+0.5,13],true);
        }
    }
}




module OLD01_OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(bearingSize,totalHeight){
    if(bearingSize == 6704){
        OOBBInsertItemCoord("Bearing6704Hold",2,2,totalHeight);    
    }else if(bearingSize == 6803){
        OOBBInsertItemCoord("Bearing6803Hold",2,2,totalHeight);    
    }
}


module OLD01_OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(bearingSize,totalHeight){
    
    
    
    
    nutHeight = totalHeight-5; //the height the nut is inserted at
    nutGap = 3.5;  //the length of the extrusion (distance from bottom is nutHeight - nutGap)
    nutWindow = 0; //the height of the nut (nutgap - nutWindow is the height of the gap mistake not fixed.)
    
    //captive m3 nuts 2.5
    
    
    //Servo Low
    OOBBInsertItemMM90("M3NutCaptive",2.333*OOBBSpacing,1*OOBBSpacing-2,ooZ=nutHeight,height=nutGap);      
    //OOBBInsertItemMM("M3HoleExtra",2.333*OOBBSpacing,3*OOBBSpacing+2,height=nutHeight,ooZ=nutHeight);      
    OOBBInsertItemMM("M3Hole",2.333*OOBBSpacing,3*OOBBSpacing+2);      
    
    
    //Servo High
    OOBBInsertItemMM90("M3NutCaptive",2.333*OOBBSpacing,3*OOBBSpacing+2,ooZ=nutHeight,height=nutGap);          
    //OOBBInsertItemMM("M3HoleExtra",2.333*OOBBSpacing,3*OOBBSpacing+2,height=nutHeight,ooZ=nutHeight);            
    OOBBInsertItemMM("M3Hole",2.333*OOBBSpacing,1*OOBBSpacing-2);      
    
    
    //Base Low
    OOBBInsertItemMM90("M3NutCaptive",1.667*OOBBSpacing,1*OOBBSpacing-2,ooZ=nutHeight,height=nutGap);         
    //OOBBInsertItemMM("M3HoleExtra",1.667*OOBBSpacing,1*OOBBSpacing-2,height=nutHeight,ooZ=nutHeight);      
    OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,1*OOBBSpacing-2);      
    
    //Base High
    OOBBInsertItemMM90("M3NutCaptive",1.667*OOBBSpacing,3*OOBBSpacing+2,ooZ=nutHeight,height=nutGap);          
    //OOBBInsertItemMM("M3HoleExtra",1.667*OOBBSpacing,3*OOBBSpacing+2,height=nutHeight,ooZ=nutHeight);
    OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,3*OOBBSpacing+2);
    
//LINKING SQUARES
    translate([OOBBSpacing*2.33,OOBBSpacing*0.5-1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    } 
    
    translate([OOBBSpacing*2.33,OOBBSpacing*3.5+1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    } 
    translate([OOBBSpacing*1.67,OOBBSpacing*0.5-1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    }
    translate([OOBBSpacing*1.67,OOBBSpacing*3.5+1.5,nutHeight-nutGap+nutWindow]){
        linear_extrude(nutGap-nutWindow){
            square([OOBBNutM3WidthShortSide,15],true);
        }
    }


    
}




module OLD01_OOBB_HL_SM_03_03_HOLDER_SERVOBRACKETCLEARANCE(){
    //clearance hole (bigger than needs to be at the moment)
    OOBBInsertItemCoord("ServoMicroHole",2,2,height=10);
    
    
    //servo holder negative
    
    //servoHolderCutoutSize = DEFINED AT TOP
    
    //servoHolderExtraClearance = DEFINED AT TOP;
    translate([2*OOBBSpacing,2*OOBBSpacing,0]){
        translate([-5.35,0,0]){
            OOBBPLOutline3DComplete(39+servoHolderExtraClearance,21,servoHolderCutoutSize);
        }
        //piece with screw holes
        translate([5,0,0]){
            OOBBPLOutline3DComplete(11+servoHolderExtraClearance,42+servoHolderExtraClearance*2,servoHolderCutoutSize);
        }       
    }
}

module OLD01_OOBB_HL_SM_03_03_SERVOHORN(bearingSize){
	
	/*
				BASE 2.5 (both in botTube)
				HORN 1.5
				TUBE 0.5  4.5
				TUBE BIG 2
				NUT GAP 5
				TOP 3
			*/
	botTubeHeight = bearingSize==6803 ? 5.5 : 4.5; //default to 6704
	bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
	bigTubeHeight = 2;
	armHeight = 3+OOBBNutM6Height;
	totalHeight = botTubeHeight+bigTubeHeight+armHeight;
	difference(){

		union(){
			
			
			//bottomTube
			
			translate([0,0,0]){
				OOBBcylinder(botTubeHeight,bearingInside,bearingInside);
			}
			//bigTube    
			
			translate([0,0,botTubeHeight+bigTubeHeight/2]){
				cylinder(bigTubeHeight,24/2,24/2,true);
			}
			//arm
			
			translate([0,0,botTubeHeight+bigTubeHeight]){
				OOBBPLOutline3DComplete(42,24,8.5);
			}
		}
		OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
		
		//OOBBInsertItemCoord("ServoMicroHornCatch",0,0,4);
		OOBBInsertItemCoord("ServoMicroHornCatchSingle",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
		
		OOBBHole3D(0,0);
		OOBBHole3D(-1,0);
		OOBBHole3D(1,0);
		OOBBInsertItemCoord("M6NutCaptiveSingle",-1,0,totalHeight-3);
		OOBBInsertItemCoord("M6NutCaptiveSingle",0,0,totalHeight-3);
		OOBBInsertItemCoord("M6NutCaptiveSingle",-1.2,0,totalHeight-3);
		OOBBInsertItemCoord("M6NutCaptiveSingle",1,0,totalHeight-3);
		OOBBInsertItemCoord("M6NutCaptiveSingle",1.2,0,totalHeight-3);
	}
	
}

module OLD02_OOBB_HL_SM_03_03_SERVOHORN(bearingSize){
	
	
    botTubeHeight=2;
	bearingTubeHeight = bearingSize==6803 ? 5 : 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
	bearingLittle = bearingSize==6803 ? OOBBBearing6803Little : OOBBBearing6704Little;
    topTubeHeight = 3;
	totalHeight = botTubeHeight+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19
	difference(){

		union(){
			
			
			//bottomTube
			
			translate([0,0,0]){
				//OOBBcylinder(botTubeHeight,bearingLittle-0.5,bearingLittle-0.5);
                OOBBcylinder(botTubeHeight,18.5/2,18.5/2);
			}
			//bearingTube    
			
			translate([0,0,botTubeHeight+bearingTubeHeight/2  ]){
				cylinder(bearingTubeHeight,bearingInside,bearingInside,true);
			}
            
			translate([0,0,botTubeHeight+bearingTubeHeight+topTubeHeight/2  ]){
				//cylinder(topTubeHeight,bearingLittle-0.5,bearingLittle-0.5,true);
                cylinder(topTubeHeight,18.5/2,18.5/2,true);
			}
            translate([0,0,totalHeight]){
                rotate([0,180,0]){
                    OOBB_WH_SOLID(3);
                }
            }	
		}
		OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
		OOBBInsertItemCoord("OOBBHole",0,0,height=4);
		
		
		//OOBBInsertItemCoord("ServoMicroHornCatch",0,0,4);
		OOBBInsertItemCoord("ServoMicroHornCatchSingleBottomInsertion",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
		
        //blank for screw insertion
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+1);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+2);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+3);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+4);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+5);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+6);
		
        //blank for screw insertion
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-1);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-2);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-3);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-4);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-5);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-6);
		
	}
	
}



module OLD01_OOBB_HL_SM_03_03_BASE(bearingSize){
	//height = 16   
	union(){ 
		difference(){
			union(){
				OOBBPLOutline3D(3,3,16);
				//extra end bits to keep servo bracket from sticking out the end.
				translate([-1,0,0]){
					OOBBPLOutline3D(3,3,16);
				}
				translate([1,0,0]){
					OOBBPLOutline3D(3,3,16);
				}
			}
			OOBBInsertItemCoord("ServoWireClearance",3,2,ooZ=16);      
			OOBBHole3D(1,1);
			OOBBHole3D(3,1);
			OOBBHole3D(1,3);
			OOBBHole3D(3,3);
			OOBBInsertItemCoord("ServoMicroHole",2,2,height=12);
			
            //LOWER SIDE
            
            OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,1*OOBBSpacing-2);      
			OOBBInsertItemMM("M3SocketHeadUpsideDown",1.667*OOBBSpacing,1*OOBBSpacing-2 ,ooZ=0);  
			OOBBInsertItemMM("M3HoleScrewTop",2.333*OOBBSpacing,1*OOBBSpacing-2);      
			
            //UPPER SIDE
            OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,3*OOBBSpacing+2);      
			OOBBInsertItemMM("M3SocketHeadUpsideDown",1.667*OOBBSpacing,3*OOBBSpacing+2,ooZ=0);
			OOBBInsertItemMM("M3HoleScrewTop",2.333*OOBBSpacing,3*OOBBSpacing+2);      
			
            
            //servo holder negative
			translate([2*OOBBSpacing,2*OOBBSpacing,0]){
				translate([-5.35,0,16-6.5]){
					OOBBPLOutline3DComplete(39+4,21,6.5);
				}
				
			}
			//servo holder negative
            
            //servoHolderCutoutSize = DEFINED AT TOP
            
			translate([2*OOBBSpacing,2*OOBBSpacing,0]){
				translate([-5.35,0,16-(servoBracketThickness+0.5-servoHolderCutoutSize)]){
					OOBBPLOutline3DComplete(39+servoHolderExtraClearance,21,(servoBracketThickness+0.5-servoHolderCutoutSize));
				}
				//piece with screw holes
				translate([5,0,16-(servoBracketThickness+0.5-servoHolderCutoutSize)]){
					OOBBPLOutline3DComplete(11+servoHolderExtraClearance,42+servoHolderExtraClearance*2,(servoBracketThickness+0.5-servoHolderCutoutSize));      
				}        
				
			}

		}        
		//extra block added to conceal servo
		translate([OOBBSpacing * 1-6, OOBBSpacing*2,0]){
			linear_extrude(16-7){
				square([2,16],true);
			}
		}
	}    
}


module OLD01_OOBB_HL_SM_03_03_BRACKET(bearingSize){
	difference(){
		union(){
			//servo piece
			translate([-5.35,0,0]){
				//OOBBPLOutline3DComplete(33,20,6);
				linear_extrude(servoBracketThickness){
					square([33,20],true);
				}
			}
			//piece with screw holes
			translate([5,0,0]){
				//OOBBPLOutline3DComplete(10,42,6);
				linear_extrude(servoBracketThickness){
					square([10,42],true);
				}
			}
		}
		OOBBInsertItemCoord("ServoMicroMount",0,0,height=12);
		OOBBInsertItemMM("M3Slot",0.33*OOBBSpacing,1*OOBBSpacing+2);
		OOBBInsertItemMM("M3Slot",0.33*OOBBSpacing,-1*OOBBSpacing-2);
		//2.333*OOBBSpacing,1*OOBBSpacing-2
	}
}

//################################################################################################
//######  OLD OLD OLD OLD OLD OLD
//################################################################################################
//################################################################################################
//################################################################################################
//################################################################################################
//################################################################################################
//################################################################################################
//################################################################################################
//################################################################################################

module OLD_OOBB_HL_SM_03_03(bearingSize){


	//######  HOLDER PART
	if( extra == "NONE" || extra=="HOLDER" || extra=="NOHORN"){
		
		
		translate([0,OOBBSpacing * 3,0]){    
			
			//translate([0,OOBBSpacing * 0,0]){    
			
			spacerHeight = 12;
			//6704
			bearingHeight = bearingSize == 6803 ? 5 : 4;  //default to 6704
			
			
			totalHeight = spacerHeight + bearingHeight;
			union(){
				//extra block added to conceal servo
				translate([OOBBSpacing * 1-6, OOBBSpacing*2,8]){
					linear_extrude(2){
						square([2,16],true);
					}
				}
				difference(){
					union(){
						OOBBPLOutline3D(3,3,totalHeight);
						//extra end bits to keep servo bracket from sticking out the end.
						translate([-1,0,0]){
							OOBBPLOutline3D(3,3,totalHeight);
						}
						translate([1,0,0]){
							OOBBPLOutline3D(3,3,totalHeight);
						}
					}
					//holes
					OOBBHole3D(1,1);
					//extra clearance hole
					OOBBInsertItemCoord("M6BoltClearance",1,1,totalHeight,height=4);      
					OOBBHole3D(1,3);   
					OOBBInsertItemCoord("M6BoltClearance",1,3,totalHeight,height=4);
					OOBBHole3D(3,1);   
					OOBBInsertItemCoord("M6BoltClearance",3,1,totalHeight,height=4);
					OOBBHole3D(3,3);   
					OOBBInsertItemCoord("M6BoltClearance",3,3,totalHeight,height=4);
					
					//extra keepout FOR BOLTS (8 TWO FOR EACH CORNER)
					translate([OOBBSpacing*1,OOBBSpacing*1-3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*1-3.5,OOBBSpacing*1,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					}
					
					translate([OOBBSpacing*3,OOBBSpacing*1-3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*3+3.5,OOBBSpacing*1,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					}
					
					translate([OOBBSpacing*1,OOBBSpacing*3+3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*1-3.5,OOBBSpacing*3,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					}
					
					translate([OOBBSpacing*3,OOBBSpacing*3+3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*3+3.5,OOBBSpacing*3,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					} 
					
					
					
					//bearing hole
					
					///6704
					echo(totalHeight);
					if(bearingSize == 6704){
						OOBBInsertItemCoord("Bearing6704Hold",2,2,totalHeight);    
					}else if(bearingSize == 6803){
						OOBBInsertItemCoord("Bearing6803Hold",2,2,totalHeight);    
					}
					
					
					
					nutHeight = totalHeight-5; //the height the nut is inserted at
					nutGap = 3.5;  //the length of the extrusion (distance from bottom is nutHeight - nutGap)
					nutWindow = 0; //the height of the nut (nutgap - nutWindow is the height of the gap mistake not fixed.)
					//LINKING SQUARES
					translate([OOBBSpacing*2.33,OOBBSpacing*0.5-1.5,nutHeight-nutGap+nutWindow]){
						linear_extrude(nutGap-nutWindow){
							square([OOBBNutM3WidthShortSide,15],true);
						}
					} 
					
					translate([OOBBSpacing*2.33,OOBBSpacing*3.5+1.5,nutHeight-nutGap+nutWindow]){
						linear_extrude(nutGap-nutWindow){
							square([OOBBNutM3WidthShortSide,15],true);
						}
					} 
					translate([OOBBSpacing*1.67,OOBBSpacing*0.5-1.5,nutHeight-nutGap+nutWindow]){
						linear_extrude(nutGap-nutWindow){
							square([OOBBNutM3WidthShortSide,15],true);
						}
					}
					translate([OOBBSpacing*1.67,OOBBSpacing*3.5+1.5,nutHeight-nutGap+nutWindow]){
						linear_extrude(nutGap-nutWindow){
							square([OOBBNutM3WidthShortSide,15],true);
						}
					}
					//captive m3 nuts 2.5
					
					
					OOBBInsertItemMM90("M3NutCaptive",2.333*OOBBSpacing,1*OOBBSpacing-2,ooZ=nutHeight,height=nutGap);      
					//servoHolderPart
					//m3 bolts
					OOBBInsertItemMM("M3Hole",2.333*OOBBSpacing,1*OOBBSpacing-2,height=nutHeight,ooZ=nutHeight);      
					
					
					OOBBInsertItemMM90("M3NutCaptive",2.333*OOBBSpacing,3*OOBBSpacing+2,ooZ=nutHeight,height=nutGap);          
					OOBBInsertItemMM("M3Hole",2.333*OOBBSpacing,3*OOBBSpacing+2,height=nutHeight,ooZ=nutHeight);            
					//captivem3 nuts 1.5
					
					
					OOBBInsertItemMM90("M3NutCaptive",1.667*OOBBSpacing,1*OOBBSpacing-2,ooZ=nutHeight,height=nutGap);         
					//servoHolderPart
					//m3 bolts
					OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,1*OOBBSpacing-2,height=nutHeight,ooZ=nutHeight);      
					
					
					OOBBInsertItemMM90("M3NutCaptive",1.667*OOBBSpacing,3*OOBBSpacing+2,ooZ=nutHeight,height=nutGap);          
					OOBBInsertItemMM("M3Hole",1.667*OOBBSpacing,3*OOBBSpacing+2,height=nutHeight,ooZ=nutHeight);      
					
					//Clearance for servo bracket
					
					
					
					
					//clearance hole
					OOBBInsertItemCoord("ServoMicroHole",2,2,height=10);
					//servo holder negative
					translate([2*OOBBSpacing,2*OOBBSpacing,0]){
						translate([-5.35,0,0]){
							OOBBPLOutline3DComplete(39+4,21,6);
						}
						//piece with screw holes
						translate([5,0,0]){
							OOBBPLOutline3DComplete(11+4,42+8,6);
						}        
						
					}
				}
			}  
		}
	}
	//######  SERVO BRACKET
	if( extra == "NONE" || extra=="BRACKET" || extra=="NOHORN"){
		

		translate([OOBBSpacing * 2,OOBBSpacing * 2,0]){
			difference(){
				union(){
					//servo piece
					translate([-5.35,0,0]){
						//OOBBPLOutline3DComplete(33,20,6);
						linear_extrude(4){
							square([33,20],true);
						}
					}
					//piece with screw holes
					translate([5,0,0]){
						//OOBBPLOutline3DComplete(10,42,6);
						linear_extrude(4){
							square([10,42],true);
						}
					}
				}
				OOBBInsertItemCoord("ServoMicroMount",0,0,height=12);
				OOBBInsertItemMM("M3Slot",0.33*OOBBSpacing,1*OOBBSpacing+2);
				OOBBInsertItemMM("M3Slot",0.33*OOBBSpacing,-1*OOBBSpacing-2);
				//2.333*OOBBSpacing,1*OOBBSpacing-2
			}
		}
	}

	//###### Servo Horn
	if( extra == "NONE" || extra=="HORN"){    
		translate([OOBBSpacing * 2,OOBBSpacing * 11,0]){    
			/*
				BASE 2.5 (both in botTube)
				HORN 1.5
				TUBE 0.5  4.5
				TUBE BIG 2
				NUT GAP 5
				TOP 3
			*/
			botTubeHeight = bearingSize==6803 ? 5.5 : 4.5; //default to 6704
			bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
			bigTubeHeight = 2;
			armHeight = 3+OOBBNutM6Height;
			totalHeight = botTubeHeight+bigTubeHeight+armHeight;
			difference(){

				union(){
					
					
					//bottomTube
					
					translate([0,0,0]){
						OOBBcylinder(botTubeHeight,bearingInside,bearingInside);
					}
					//bigTube    
					
					translate([0,0,botTubeHeight+bigTubeHeight/2]){
						cylinder(bigTubeHeight,24/2,24/2,true);
					}
					//arm
					
					translate([0,0,botTubeHeight+bigTubeHeight]){
						OOBBPLOutline3DComplete(42,24,8.5);
					}
				}
				OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
				
				//OOBBInsertItemCoord("ServoMicroHornCatch",0,0,4);
				OOBBInsertItemCoord("ServoMicroHornCatchSingle",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
				
				OOBBHole3D(0,0);
				OOBBHole3D(-1,0);
				OOBBHole3D(1,0);
				OOBBInsertItemCoord("M6NutCaptiveSingle",-1,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",0,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",-1.2,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",1,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",1.2,0,totalHeight-3);
			}
			
		}
	}
	//######  Base
	if( extra == "NONE" || extra=="BASE" || extra=="NOHORN"){    
		translate([0,OOBBSpacing * 6,0]){ 
			//height = 16   
			union(){ 
				difference(){
					union(){
						OOBBPLOutline3D(3,3,16);
						//extra end bits to keep servo bracket from sticking out the end.
						translate([-1,0,0]){
							OOBBPLOutline3D(3,3,16);
						}
						translate([1,0,0]){
							OOBBPLOutline3D(3,3,16);
						}
					}
					OOBBInsertItemCoord("ServoWireClearance",3,2,ooZ=16);      
					OOBBHole3D(1,1);
					OOBBHole3D(3,1);
					OOBBHole3D(1,3);
					OOBBHole3D(3,3);
					OOBBInsertItemCoord("ServoMicroHole",2,2,height=12);
					OOBBInsertItemCoord("M3Hole",1.667,1);      
					OOBBInsertItemCoord("M3SocketHeadUpsideDown",1.667,1 ,ooZ=0);  
					OOBBInsertItemCoord("M3Hole",1.667,3);      
					//OOBBInsertItemCoord("M3CountersinkUpsideDown",1.667,3,ooZ=0);
					OOBBInsertItemCoord("M3SocketHeadUpsideDown",1.667,3,ooZ=0);
					OOBBInsertItemMM("M3HoleScrewTop",2.333*OOBBSpacing,3*OOBBSpacing+2);      
					OOBBInsertItemMM("M3HoleScrewTop",2.333*OOBBSpacing,1*OOBBSpacing-2);      
					//servo holder negative
					translate([2*OOBBSpacing,2*OOBBSpacing,0]){
						translate([-5.35,0,16-6.5]){
							OOBBPLOutline3DComplete(39+4,21,6.5);
						}
						
					}
					//servo holder negative
					translate([2*OOBBSpacing,2*OOBBSpacing,0]){
						translate([-5.35,0,16-4.5]){
							OOBBPLOutline3DComplete(39+4,21,4.5);
						}
						//piece with screw holes
						translate([5,0,16-4.5]){
							OOBBPLOutline3DComplete(11+4,42+8,4.5);      
						}        
						
					}

				}        
				//extra block added to conceal servo
				translate([OOBBSpacing * 1-6, OOBBSpacing*2,0]){
					linear_extrude(12-7){
						square([2,16],true);
					}
				}
			}
		} 
	}   

}



module OLDOLD_OOBB_HL_SM_03_03(bearingSize){


	//######  HOLDER PART
	if( extra == "NONE" || extra=="HOLDER" || extra=="NOHORN"){
		
		
		translate([0,OOBBSpacing * 3,0]){    
			
			//translate([0,OOBBSpacing * 0,0]){    
			
			spacerHeight = 12;
			//6704
			bearingHeight = bearingSize == 6803 ? 5 : 4;  //default to 6704
			
			
			totalHeight = spacerHeight + bearingHeight;
			union(){
				//extra block added to conceal servo
				translate([OOBBSpacing * 1-6, OOBBSpacing*2,4]){
					linear_extrude(8){
						square([2,16],true);
					}
				}
				difference(){
					union(){
						OOBBPLOutline3D(3,3,totalHeight);
						//extra end bits to keep servo bracket from sticking out the end.
						translate([-1,0,0]){
							OOBBPLOutline3D(3,3,totalHeight);
						}
						translate([1,0,0]){
							OOBBPLOutline3D(3,3,totalHeight);
						}
					}
					//holes
					OOBBHole3D(1,1);
					//extra clearance hole
					OOBBInsertItemCoord("M6BoltClearance",1,1,totalHeight,height=4);      
					OOBBHole3D(1,3);   
					OOBBInsertItemCoord("M6BoltClearance",1,3,totalHeight,height=4);
					OOBBHole3D(3,1);   
					OOBBInsertItemCoord("M6BoltClearance",3,1,totalHeight,height=4);
					OOBBHole3D(3,3);   
					OOBBInsertItemCoord("M6BoltClearance",3,3,totalHeight,height=4);
					
					//extra keepout FOR BOLTS (8 TWO FOR EACH CORNER)
					translate([OOBBSpacing*1,OOBBSpacing*1-3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*1-3.5,OOBBSpacing*1,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					}
					
					translate([OOBBSpacing*3,OOBBSpacing*1-3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*3+3.5,OOBBSpacing*1,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					}
					
					translate([OOBBSpacing*1,OOBBSpacing*3+3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*1-3.5,OOBBSpacing*3,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					}
					
					translate([OOBBSpacing*3,OOBBSpacing*3+3,totalHeight-4]){
						linear_extrude(4){
							square([13,13/2],true);
						}
					}  
					translate([OOBBSpacing*3+3.5,OOBBSpacing*3,totalHeight-4]){
						linear_extrude(4){
							square([13/2+0.5,13],true);
						}
					} 
					
					
					
					//bearing hole
					
					///6704
					echo(totalHeight);
					if(bearingSize == 6704){
						OOBBInsertItemCoord("Bearing6704Hold",2,2,totalHeight);    
					}else if(bearingSize == 6803){
						OOBBInsertItemCoord("Bearing6803Hold",2,2,totalHeight);    
					}
					
					
					
					nutHeight = 9; //the height the nut is inserted at
					nutGap = 7;  //the length of the extrusion (distance from bottom is nutHeight - nutGap)
					nutWindow = 3; //the height of the nut (nutgap - nutWindow is the height of the gap mistake not fixed.)
					//LINKING SQUARES
					translate([OOBBSpacing*2.33,OOBBSpacing*2,nutHeight-nutGap+nutWindow]){
						linear_extrude(nutGap-nutWindow){
							square([OOBBNutM3WidthShortSide,30],true);
						}
					} 
					translate([OOBBSpacing*1.67,OOBBSpacing*2,nutHeight-nutGap+nutWindow]){
						linear_extrude(nutGap-nutWindow){
							square([OOBBNutM3WidthShortSide,30],true);
						}
					}
					//captive m3 nuts 2.5
					
					
					OOBBInsertItemCoord90("M3NutCaptive",2.333,1,ooZ=nutHeight,height=nutGap);      
					//servoHolderPart
					//m3 bolts
					OOBBInsertItemCoord("M3HoleExtra",2.333,1,height=nutHeight,ooZ=nutHeight);      
					
					
					OOBBInsertItemCoord90("M3NutCaptive",2.333,3,ooZ=nutHeight,height=nutGap);          
					OOBBInsertItemCoord("M3HoleExtra",2.333,3,height=nutHeight,ooZ=nutHeight);            
					//captivem3 nuts 1.5
					
					
					OOBBInsertItemCoord90("M3NutCaptive",1.667,1,ooZ=nutHeight,height=nutGap);         
					//servoHolderPart
					//m3 bolts
					OOBBInsertItemCoord("M3HoleExtra",1.667,1,height=nutHeight,ooZ=nutHeight);      
					
					
					OOBBInsertItemCoord90("M3NutCaptive",1.667,3,ooZ=nutHeight,height=nutGap);          
					OOBBInsertItemCoord("M3HoleExtra",1.667,3,height=nutHeight,ooZ=nutHeight);      
					
					
					
					
					
					//clearance hole
					OOBBInsertItemCoord("ServoMicroHole",2,2,height=9);
				}
			}  
		}
	}
	//######  SERVO BRACKET
	if( extra == "NONE" || extra=="BRACKET" || extra=="NOHORN"){
		

		translate([OOBBSpacing * 2,OOBBSpacing * 2,0]){
			difference(){
				union(){
					//servo piece
					translate([-5.35,0,0]){
						//OOBBPLOutline3DComplete(33,20,6);
						linear_extrude(6){
							square([33,20],true);
						}
					}
					//piece with screw holes
					translate([5,0,0]){
						//OOBBPLOutline3DComplete(10,42,6);
						linear_extrude(6){
							square([10,42],true);
						}
					}
				}
				OOBBInsertItemCoord("ServoMicroMount",0,0,height=12);
				OOBBInsertItemCoord("M3Slot",0.33,1);
				OOBBInsertItemCoord("M3Slot",0.33,-1);
			}
		}
	}

	//###### Servo Horn
	if( extra == "NONE" || extra=="HORN"){    
		translate([OOBBSpacing * 2,OOBBSpacing * 11,0]){    
			/*
				BASE 2.5 (both in botTube)
				HORN 1.5
				TUBE 0.5  4.5
				TUBE BIG 2
				NUT GAP 5
				TOP 3
			*/
			botTubeHeight = bearingSize==6803 ? 5.5 : 4.5; //default to 6704
			bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
			bigTubeHeight = 2;
			armHeight = 3+OOBBNutM6Height;
			totalHeight = botTubeHeight+bigTubeHeight+armHeight;
			difference(){

				union(){
					
					
					//bottomTube
					
					translate([0,0,0]){
						OOBBcylinder(botTubeHeight,bearingInside,bearingInside);
					}
					//bigTube    
					
					translate([0,0,botTubeHeight+bigTubeHeight/2]){
						cylinder(bigTubeHeight,24/2,24/2,true);
					}
					//arm
					
					translate([0,0,botTubeHeight+bigTubeHeight]){
						OOBBPLOutline3DComplete(42,24,8.5);
					}
				}
				OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
				
				//OOBBInsertItemCoord("ServoMicroHornCatch",0,0,4);
				OOBBInsertItemCoord("ServoMicroHornCatchSingle",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
				
				OOBBHole3D(0,0);
				OOBBHole3D(-1,0);
				OOBBHole3D(1,0);
				OOBBInsertItemCoord("M6NutCaptiveSingle",-1,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",0,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",-1.2,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",1,0,totalHeight-3);
				OOBBInsertItemCoord("M6NutCaptiveSingle",1.2,0,totalHeight-3);
			}
			
		}
	}
	//######  Base
	if( extra == "NONE" || extra=="BASE" || extra=="NOHORN"){    
		translate([0,OOBBSpacing * 6,0]){    
			union(){ 
				difference(){
					union(){
						OOBBPLOutline3D(3,3,18);
						//extra end bits to keep servo bracket from sticking out the end.
						translate([-1,0,0]){
							OOBBPLOutline3D(3,3,18);
						}
						translate([1,0,0]){
							OOBBPLOutline3D(3,3,18);
						}
					}
					OOBBInsertItemCoord("ServoWireClearance",3,2,ooZ=18);      
					OOBBHole3D(1,1);
					OOBBHole3D(3,1);
					OOBBHole3D(1,3);
					OOBBHole3D(3,3);
					OOBBInsertItemCoord("ServoMicroHole",2,2,height=18);
					OOBBInsertItemCoord("M3Hole",1.667,1);      
					OOBBInsertItemCoord("M3SocketHeadUpsideDown",1.667,1 ,ooZ=0);  
					OOBBInsertItemCoord("M3Hole",1.667,3);      
					//OOBBInsertItemCoord("M3CountersinkUpsideDown",1.667,3,ooZ=0);
					OOBBInsertItemCoord("M3SocketHeadUpsideDown",1.667,3,ooZ=0);
					OOBBInsertItemCoord("M3HoleScrewTop",2.333,3);      
					OOBBInsertItemCoord("M3HoleScrewTop",2.333,1);      
					//servo holder negative
					translate([2*OOBBSpacing,2*OOBBSpacing,0]){
						translate([-5.35,0,18-6.5]){
							OOBBPLOutline3DComplete(39+4,21,6.5);
						}
						//piece with screw holes
						translate([5,0,18-6.5]){
							OOBBPLOutline3DComplete(11+4,42+8,6.5);
						}        
						
					}

				}        
				//extra block added to conceal servo
				translate([OOBBSpacing * 1-6, OOBBSpacing*2,0]){
					linear_extrude(11){
						square([2,16],true);
					}
				}
			}
		} 
	}   

}

/*
///########
///########
///########  MAIN
///########


//servo holder negative (used in holder and base)
     
    //servoHolderCutoutSize = 6; //testing
    servoHolderCutoutSize = 1; //SG90
    
//servo bracket thickness (used in bracket and base)

    servoBracketThickness = 4;
    servoHolderExtraClearance = 0.5;
    OOBBbaseBoltOffset = 8;
    
    //full size servo variables
    servoBracketThicknessFull = 4+6 +2.5; //add the thickness of the holder 

module OOBB_HL_SM_03_03(bearingSize){
	//######  HOLDER PART
	if( extra == "NONE" || extra=="HOLDER"  || extra=="HOLDERA"  || extra=="HOLDERB" || extra=="NOHORN"){
		translate([0,OOBBSpacing * 3,0]){
        //translate([0,0,0]){    
			OOBB_HL_SM_03_03_HOLDER(bearingSize);    
		}
	}
	//######  SERVO BRACKET
	if( extra == "NONE" || extra=="BRACKET" || extra=="NOHORN"){
		translate([OOBBSpacing * 2,OOBBSpacing * 2,0]){
        //translate([0,0,0]){ 
			OOBB_HL_SM_03_03_BRACKET(bearingSize);
		}
	}
	//###### Servo Horn
	if( extra == "NONE" || extra=="HORN"){    
		translate([OOBBSpacing * 5,OOBBSpacing * 4,0]){    
		//translate([0,0,0]){    
			OOBB_HL_SM_03_03_SERVOHORN(bearingSize);
		}
	}
	//######  Base
	if( extra == "NONE" || extra=="BASE" || extra=="NOHORN"){    
		translate([OOBBSpacing * 3 + 5,OOBBSpacing * 6,0]){ 
        //translate([0,0,0]){    
            
                OOBB_HL_SM_03_03_BASE(bearingSize);
            
		} 
	}   
}

//todo
//add a second M3 hole to hold servo on each side
//remove slot for single hole
//make screws come up from bottom
//add block to lock m3 nuts on servo
module OOBB_HL_SE_05_03(bearingSize){
	//######  HOLDER PART
	if( extra == "NONE" || extra=="HOLDER"  || extra=="HOLDERA"  || extra=="HOLDERB" || extra=="NOHORN"){
		translate([OOBBSpacing * 1,OOBBSpacing * 2,0]){
        //translate([0,0,0]){    
			OOBB_HL_SE_05_03_HOLDER(bearingSize);    
		}
	}
    
	//######  SERVO BRACKET
	if( extra == "NONE" || extra=="BRACKET" || extra=="NOHORN"){
		translate([OOBBSpacing * 3,OOBBSpacing * 8.5,0]){
        //translate([0,0,0]){ 
			OOBB_HL_SE_05_03_BRACKET(bearingSize);
		}
	}
    
	//###### Servo Horn
	if( extra == "NONE" || extra=="HORN"){    
		translate([OOBBSpacing * 6,OOBBSpacing * 4,0]){    
		//translate([0,0,0]){    
			OOBB_HL_SE_05_03_SERVOHORN(bearingSize);
		}
	}
	//######  Base
	if( extra == "NONE" || extra=="BASE" || extra=="NOHORN"){    
		translate([OOBBSpacing * 3 + 5,OOBBSpacing * 6,0]){ 
        //translate([0,0,0]){    
            
               // OOBB_HL_SM_03_03_BASE(bearingSize);
            
		} 
	}   
}



//////////////////////////////////////////////////// SM-03-03




///########
///########
///########  HOLDER
///########
module OOBB_HL_SM_03_03_HOLDER(bearingSize){
	
    spacerHeight = 12;
    extraCapHeight = 5;  //this is the amount to stretch the cap
	bearingHeight = bearingSize == 6803 ? 5 : 4;  //default to 6704
	totalHeight = spacerHeight + bearingHeight;
	capHeight = bearingHeight + 2 + extraCapHeight;
    holderBaseHeight = 12;
    
    if( extra == "NONE"|| extra=="HOLDER" || extra=="HOLDERA"  || extra=="NOHORN"){     
        translate([OOBBSpacing*2,OOBBSpacing*2.25,capHeight]){
            rotate([0,180,0]){
                translate([-OOBBSpacing*2,-OOBBSpacing*2,0]){
                    difference(){
                            OOBB_HL_SM_03_03_HOLDER_CAP(capHeight,extraCapHeight);
                            OOBB_HL_SM_03_03_HOLDER_MAINHOLES(capHeight);
                            OOBB_HL_SM_03_03_HOLDER_MAINHOLES_CAPONLY(capHeight);
                            OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(bearingSize, capHeight -2);
                            OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(bearingSize, capHeight);
                            
                        }
                    }
                }
            }
        }
    if( extra == "NONE"|| extra=="HOLDER" || extra=="HOLDERB"  || extra=="NOHORN"){     
        //holder base
        translate([0,50,capHeight-holderBaseHeight]){  //for printing
        //translate([0,0,-20]){    // fodevelopment
            difference(){
                OOBB_HL_SM_03_03_HOLDER_BASE(bearingSize, holderBaseHeight, extraCapHeight);
                OOBB_HL_SM_03_03_HOLDER_MAINHOLES(holderBaseHeight);
                OOBB_HL_SM_03_03_HOLDER_MAINHOLES_CAPONLY(holderBaseHeight);
			}
        }
    }   
        
	  
}

module OOBB_HL_SM_03_03_HOLDER_CAP(capHeight,extraCapHeight){
    difference(){
        union(){
            OOBBPLOutline3D(3,3,capHeight);
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
        }
        TOP = 3;
        RIGHT = 3;
        BOTTOM = 1;
        LEFT = 1;
        
        //Extra bearing clearance
        translate([OOBBSpacing*2,OOBBSpacing*2,0]){
                cylinder(extraCapHeight, OOBBBearing6803OutsideHold+1, OOBBBearing6803OutsideHold+1); //.clearance given in base
            }
        
        //RIGHT TOP
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",RIGHT,TOP,capHeight,height=4,rot=180);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",RIGHT*OOBBSpacing+1,TOP*OOBBSpacing,capHeight,height=4,rot=180);
        //LEFT TOP
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",LEFT,TOP,capHeight,height=4,rot=270);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",LEFT*OOBBSpacing-1,TOP*OOBBSpacing,capHeight,height=4,rot=270);
        //RIGHT BOTTOM
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",RIGHT,BOTTOM,capHeight,height=4,rot=90);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",RIGHT*OOBBSpacing+1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=90);
        //LEFT BOTTOM
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",LEFT,BOTTOM,capHeight,height=4,rot=0);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",LEFT*OOBBSpacing-1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=0);
    }
}

module OOBB_HL_SM_03_03_HOLDER_BASE(bearingSize, holderBaseHeight,extraCapHeight){
    difference(){
        union(){
            OOBBPLOutline3D(3,3,holderBaseHeight);
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(3,3,holderBaseHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,holderBaseHeight);
            }
            //bearing push up piece
            translate([OOBBSpacing*2,OOBBSpacing*2,holderBaseHeight]){
                cylinder(extraCapHeight, OOBBBearing6803OutsideHold+1-.2, OOBBBearing6803OutsideHold+1-.2); //.2 extra clearance guess Bearing push up piece
            }
        }
        if(bearingSize == 6704){
            OOBBInsertItemCoord("Bearing6704Little",2,2,holderBaseHeight);    
        }else if(bearingSize == 6803){
            OOBBInsertItemCoord("Bearing6803Little",2,2,holderBaseHeight);    
        }
           
		//Servo Low
    OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,3*OOBBSpacing+2,ooZ=OOBBNutM3Height,height=20);      
    //Servo High
    OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,1*OOBBSpacing-2,ooZ=OOBBNutM3Height,height=20);      
   
    OOBBInsertItemMM("M3NutCaptive",3*OOBBSpacing+2,2*OOBBSpacing,ooZ=OOBBNutM3Height,height=20);      
    
    OOBBInsertItemMM("M3NutCaptive",1*OOBBSpacing-2,2*OOBBSpacing,ooZ=holderBaseHeight-2,height=20);      
    
    
    
    OOBBInsertItemCoord("ServoMicroHole",2,2,height=holderBaseHeight-3);
    OOBB_HL_SM_03_03_BASE_HOLES();
    
    nutHeight = 4;
    OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=0);
    OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=180);
               
    	
    }
}


module OOBB_HL_SM_03_03_HOLDER_MAINHOLES_CAPONLY(totalHeight){

    OOBBInsertItemMM("M3Hole",3*OOBBSpacing+2,2*OOBBSpacing);      
    OOBBInsertItemMM("M3Hole",1*OOBBSpacing-2,2*OOBBSpacing);      
 //Servo Low
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,3*OOBBSpacing+2);      
    //Servo High
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,1*OOBBSpacing-2);   
    
}

module OOBB_HL_SM_03_03_HOLDER_MAINHOLES(totalHeight){
//holes
    OOBBHole3D(1,1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-1,1*OOBBSpacing-1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-2,1*OOBBSpacing-2);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-3,1*OOBBSpacing-3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-4,1*OOBBSpacing-4);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-5,1*OOBBSpacing-5);
    
    
    OOBBHole3D(1,3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-1,3*OOBBSpacing+1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-2,3*OOBBSpacing+2);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-3,3*OOBBSpacing+3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-4,3*OOBBSpacing+4);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-5,3*OOBBSpacing+5);
    
    
    OOBBHole3D(3,1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+1,1*OOBBSpacing-1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+2,1*OOBBSpacing-2);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+3,1*OOBBSpacing-3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+4,1*OOBBSpacing-4);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+5,1*OOBBSpacing-5);
    
    
    OOBBHole3D(3,3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+1,3*OOBBSpacing+1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+2,3*OOBBSpacing+2);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+3,3*OOBBSpacing+3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+4,3*OOBBSpacing+4);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+5,3*OOBBSpacing+5);
    
    
    
    
}




module OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(bearingSize,totalHeight){
    if(bearingSize == 6704){
        OOBBInsertItemCoord("Bearing6704Hold",2,2,totalHeight);    
    }else if(bearingSize == 6803){
        OOBBInsertItemCoord("Bearing6803Hold",2,2,totalHeight);    
    }
}


module OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(bearingSize,capHeight){
    nutHeight = OOBBNutM3Height;
    nutGap = nutHeight;
    //Servo Low
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight);
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight-2);
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight); //to allow for using 30mm bolts      
    //Servo High
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight);
    //to allow for using 30mm bolts
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight-2); OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight); //Retaining Screws
    OOBBInsertItemMM("M3SocketHead",3*OOBBSpacing+2,2*OOBBSpacing,height=capHeight);      
    OOBBInsertItemMM("M3SocketHead",1*OOBBSpacing-2,2*OOBBSpacing,height=capHeight);      
    
    

    
}



///########
///########
///########  BRACKET
///########
module OOBB_HL_SM_03_03_BRACKET(bearingSize){
	difference(){
		union(){
			//servo piece
			translate([-5.35,0,0]){
				//OOBBPLOutline3DComplete(33,20,6);
				linear_extrude(servoBracketThickness){
					square([33,20],true);
				}
			}
			//piece with screw holes
			translate([0,0,0]){
				//OOBBPLOutline3DComplete(10,42,6);
				linear_extrude(servoBracketThickness){
					square([10,42],true);
				}
			}
		}
		OOBBInsertItemCoord("ServoMicroMount",0,0,height=12);
		OOBBInsertItemMM("M3Slot",0*OOBBSpacing,1*OOBBSpacing+2);
		OOBBInsertItemMM("M3Slot",0*OOBBSpacing,-1*OOBBSpacing-2);
		//2.333*OOBBSpacing,1*OOBBSpacing-2
	}
}


///########
///########
///########  SERVOHORN
///########

	
botTubeHeight=5;
topTubeHeight = 4;
	
module OOBB_HL_SM_03_03_SERVOHORN(bearingSize){

	bearingTubeHeight = bearingSize==6803 ? 5 : 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
	bearingLittle = bearingSize==6803 ? OOBBBearing6803Little : OOBBBearing6704Little;
    totalHeight = botTubeHeight+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19
	
    topHeight = topTubeHeight + 9; //9 is wheel width
    bottomHeight = botTubeHeight + bearingTubeHeight;
        
    
    
        //TOP PIECE
    //translate([0,0,0]){
    translate([0,0,topHeight/2]){  //move to zero height
        rotate([0,180,0]){ //rotate 180 to print upside down
            translate([0,0,-bottomHeight - topHeight/2]){ //shift so centred for flip
                difference(){
                    union(){
                        //bottomTube
                        
                        
                        //topTube
                        translate([0,0,botTubeHeight+bearingTubeHeight+topTubeHeight/2  ]){
                            //cylinder(topTubeHeight,bearingLittle-0.5,bearingLittle-0.5,true);
                            cylinder(topTubeHeight,bearingInside+1,bearingInside+1,true);
                        }
                        //wheel
                        translate([0,0,totalHeight]){
                            rotate([0,180,0]){
                                OOBB_WH_SOLID(3);
                            }
                        }
                               //bearing tube
                        translate([0,0,botTubeHeight+bearingTubeHeight/2  ]){
                            cylinder(bearingTubeHeight,bearingInside,bearingInside,true);
                            } 
                    }
                    OOBB_HL_SM_03_03_SERVOHORN_HOLES(bearingSize);
                }
            }
        }

    }
    
        // BOTTOM PIECE
    //translate([0,0,0]){
    translate([0,-OOBBSpacing*2-3,5]){
        rotate([0,180,0]){//rotate 180 to print upside down
            difference(){
                union(){
                    
                    translate([0,0,0]){
                        //OOBBcylinder(botTubeHeight,bearingLittle-0.5,bearingLittle-0.5);
                        OOBBcylinder(botTubeHeight,bearingInside+1,bearingInside+1);
                    }
                    //bearingTube    
                    
                    
                    
                    
                    
                }
                OOBB_HL_SM_03_03_SERVOHORN_HOLES(bearingSize);
            }
        }
    }    
	
}


module OOBB_HL_SM_03_03_SERVOHORN_HOLES(bearingSize){
    OOBB_screwClamp1X = 0; 
    OOBB_screwClamp2X = 0;
    OOBB_screwClamp1Y = 6.5;
    OOBB_screwClamp2Y = -6.5;
	
    
    
	bearingTubeHeight = bearingSize==6803 ? 5 : 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
	bearingLittle = bearingSize==6803 ? OOBBBearing6803Little : OOBBBearing6704Little;
    totalHeight = botTubeHeight+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19

		OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
		OOBBInsertItemCoord("OOBBHole",0,0,height=4);
		
		
	//for tg90
	//OOBBInsertItemCoord("ServoMicroHornCatchSingleBottomInsertion",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
	//for continuousRotation
    OOBBInsertItemCoord("ServoMicroHornCatchSingleContinuousBottomInsertion",0,0,3.5); 
    
    
        //clamping screws
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp1X,OOBB_screwClamp1Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp1X,OOBB_screwClamp1Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp1X,OOBB_screwClamp1Y,OOBBNutM3Height);
        
        
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp2X,OOBB_screwClamp2Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp2X,OOBB_screwClamp2Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp2X,OOBB_screwClamp2Y,OOBBNutM3Height);

        /*
        //blank for screw insertion
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+1);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+2);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+3);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+4);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+5);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+6);
		
        //blank for screw insertion
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-1);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-2);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-3);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-4);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-5);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-6);
        */
        /*
}

///########
///########
///########  BASE
///########
module OOBB_HL_SM_03_03_BASE(bearingSize){
	baseHeight= 18;
    servoHolderCutoutDepth=4.5;   
	union(){ 
		difference(){
			union(){
				OOBBPLOutline3D(3,3,baseHeight);
				//extra end bits to keep servo bracket from sticking out the end.
				translate([-1,0,0]){
					OOBBPLOutline3D(3,3,baseHeight);
				}
				translate([1,0,0]){
					OOBBPLOutline3D(3,3,baseHeight);
				}
			}

            
            OOBB_HL_SM_03_03_HOLDER_MAINHOLES(baseHeight);
            
			OOBBInsertItemCoord("ServoWireClearance",3,2,ooZ=baseHeight);      
			OOBBInsertItemCoord("ServoMicroHole",2,2,height=baseHeight);
			
            
            //CUTOUTS for servo nut
            //Servo Low
            OOBBInsertItemMM("M3NutClearanceSlide",2*OOBBSpacing,3*OOBBSpacing+2,ooZ=baseHeight-servoHolderCutoutDepth,height=5);      
            //Servo High
            OOBBInsertItemMM("M3NutClearanceSlide",2*OOBBSpacing,1*OOBBSpacing-2,ooZ=baseHeight-servoHolderCutoutDepth,height=5);   
 
            
            
            //OOBBbaseBoltOffset = DEFINED AT TOP
            
            
            
            OOBBInsertItemMM("M3SocketHeadUpsideDown",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=0);  
            OOBBInsertItemMM("M3SocketHeadUpsideDown",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=0);
            OOBB_HL_SM_03_03_BASE_HOLES();
           
			//servo holder negative
            
            //servoHolderCutoutSize = DEFINED AT TOP
            //servoHolderExtraClearance = DEFINED AT TOP
            
            
            
			translate([2*OOBBSpacing,2*OOBBSpacing,baseHeight-servoHolderCutoutDepth]){
                OOBB_HL_SM_03_03_BASE_SERVOBRACKETCLEARANCE(servoHolderCutoutDepth);               
        }

		}        
		//extra block added to conceal servo
		translate([OOBBSpacing * 1-6, OOBBSpacing*2,0]){
			linear_extrude(10){
				square([2,30],true);
			}
		}
	}    
}

module OOBB_HL_SM_03_03_BASE_HOLES(){
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=0);
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=0);
}

module OOBB_HL_SM_03_03_BASE_SERVOBRACKETCLEARANCE(servoHolderCutoutDepth){
    OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    translate([0.5,0,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
    
    translate([-0.5,0,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
    
    translate([0,0.5,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
    
    translate([0,-0.5,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
     
}

module OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth){

 //copy and pasted from bracket section, extrude height changed
              translate([-5.35,0,0]){
				//OOBBPLOutline3DComplete(33,20,6);
				linear_extrude(servoHolderCutoutDepth){
					square([33,20],true);
				}
			}
			//piece with screw holes
			translate([0,0,0]){
				//OOBBPLOutline3DComplete(10,42,6);
				linear_extrude(servoHolderCutoutDepth){
					square([10,42],true);
				}
			}
        }


//////////////////////////////////////////////////// SE-05-03
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////



///########
///########
///########  HOLDER
///########
        
baseCapHeight = 5;        
        
module OOBB_HL_SE_05_03_HOLDER(bearingSize){
	
    spacerHeight = 12;
    extraCapHeight = baseCapHeight+7;  //this is the amount to stretch the cap
	bearingHeight = bearingSize == 6803 ? 5 : 4;  //default to 6704
	totalHeight = spacerHeight + bearingHeight;
	capHeight = bearingHeight + 2 + baseCapHeight;
    holderBaseHeight = 2; //used to be 12 6 too small may need to be 9
    if( extra == "NONE"|| extra=="HOLDER" || extra=="HOLDERA" || extra=="NOHORN" ){     
        //translate([-OOBBSpacing*2,-OOBBSpacing*2,capHeight]){ // to bring it to zer0
        translate([OOBBSpacing*2,OOBBSpacing*2.25,capHeight]){
            rotate([0,180,0]){
                translate([-OOBBSpacing*2,-OOBBSpacing*4,0]){
                    difference(){
                            OOBB_HL_SE_05_03_HOLDER_CAP(capHeight,extraCapHeight);
                            OOBB_HL_SE_05_03_HOLDER_MAINHOLES(capHeight);
                            OOBB_HL_SE_05_03_HOLDER_MAINHOLES_CAPONLY(capHeight);
                            OOBB_HL_SE_05_03_HOLDER_BEARINGHOLE(bearingSize, capHeight -2);
                            OOBB_HL_SE_05_03_HOLDER_CAPTIVENUTS(bearingSize, capHeight);
                            
                        }
                    }
                }
         }
        }
    if( extra == "NONE"|| extra=="HOLDER" || extra=="HOLDERB" || extra=="NOHORN" ){     
        //holder base
        translate([0,50,0]){  //for printing
        
        //translate([0,0,-40]){    // fodevelopment
            translate([-OOBBSpacing*2,-OOBBSpacing*2,0]){
                    
                difference(){
                    OOBB_HL_SE_05_03_HOLDER_BASE(bearingSize, holderBaseHeight, extraCapHeight);
                    OOBB_HL_SE_05_03_HOLDER_MAINHOLES(holderBaseHeight);
                    OOBB_HL_SE_05_03_HOLDER_MAINHOLES_CAPONLY(holderBaseHeight);
                }
            }
        }
    }   
        
	  
}

module OOBB_HL_SE_05_03_HOLDER_CAP(capHeight,extraCapHeight){
    difference(){
        union(){
            OOBBPLOutline3D(3,3,capHeight);
            OOBBPLOutline3D(5,3,capHeight-4);
            /*
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
            */
            /*
        }
        TOP = 3;
        RIGHT = 3;
        BOTTOM = 1;
        LEFT = 1;
        
        //Extra bearing clearance
        translate([OOBBSpacing*2,OOBBSpacing*2,0]){
                cylinder(baseCapHeight, OOBBBearing6803OutsideHold+1, OOBBBearing6803OutsideHold+1); //.clearance given in base
            }
        
        //RIGHT TOP
        //OOBBInsertItemCoordRotate("M6BoltClearanceCorner",RIGHT,TOP,capHeight,height=4,rot=180);
        //OOBBInsertItemMMRotate("M6BoltClearanceCorner",RIGHT*OOBBSpacing+1,TOP*OOBBSpacing,capHeight,height=4,rot=180);
        //LEFT TOP
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",LEFT,TOP,capHeight,height=4,rot=270);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",LEFT*OOBBSpacing-1,TOP*OOBBSpacing,capHeight,height=4,rot=270);
    
            
            //RIGHT BOTTOM
    
            
        //OOBBInsertItemCoordRotate("M6BoltClearanceMiddle",RIGHT,BOTTOM,capHeight,height=4,rot=90);
        //OOBBInsertItemMMRotate("M6BoltClearanceMiddle",RIGHT*OOBBSpacing+1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=90);
        //LEFT BOTTOM
        #OOBBInsertItemCoordRotate("M6BoltClearanceMiddle",LEFT,BOTTOM,capHeight,height=4,rot=0);
        OOBBInsertItemMMRotate("M6BoltClearanceMiddle",LEFT*OOBBSpacing-1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=0);
    
            }
}

module OOBB_HL_SE_05_03_HOLDER_BASE(bearingSize, holderBaseHeight,extraCapHeight){
    difference(){
        union(){
            OOBBPLOutline3D(5,3,holderBaseHeight+extraCapHeight-baseCapHeight);
            /*
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(5,3,holderBaseHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,holderBaseHeight);
            }
            */
            /*
            //bearing push up piece
            translate([OOBBSpacing*2,OOBBSpacing*2,holderBaseHeight+extraCapHeight-baseCapHeight]){
                cylinder(baseCapHeight, OOBBBearing6803OutsideHold+1-.2, OOBBBearing6803OutsideHold+1-.2); //.2 extra clearance guess Bearing push up piece
            }
        }
        if(bearingSize == 6704){
            OOBBInsertItemCoord("Bearing6704Little",2,2,holderBaseHeight);    
        }else if(bearingSize == 6803){
            OOBBInsertItemCoord("Bearing6803Little",2,2,holderBaseHeight);    
        }
           
		//Servo Low
        
    OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,3*OOBBSpacing+2,ooZ=OOBBNutM3Height,height=20);      
    //Servo High
    OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,1*OOBBSpacing-2,ooZ=OOBBNutM3Height,height=20);      
   
    
    extraNutHeight =     holderBaseHeight+extraCapHeight-baseCapHeight-3;
    OOBBInsertItemMM("M3NutCaptive",3*OOBBSpacing+2,2*OOBBSpacing,ooZ=extraNutHeight,height=20);      
    
    OOBBInsertItemMM("M3NutCaptive",1*OOBBSpacing-2,2*OOBBSpacing,ooZ=extraNutHeight,height=20);      
    
    
    
    OOBBInsertItemCoord("ServoHole",2,2,height=holderBaseHeight+extraCapHeight-baseCapHeight-5);
    //OOBB_HL_SM_03_03_BASE_HOLES();
    
    nutHeight = 4;
    //OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=0);
    //OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=180);
               
    	
    }
}


module OOBB_HL_SE_05_03_HOLDER_MAINHOLES_CAPONLY(totalHeight){

    OOBBInsertItemMM("M3Hole",3*OOBBSpacing+2,2*OOBBSpacing);      
    OOBBInsertItemMM("M3Hole",1*OOBBSpacing-2,2*OOBBSpacing);      
 //Servo Low
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,3*OOBBSpacing+2);      
    //Servo High
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,1*OOBBSpacing-2);   
    
}

module OOBB_HL_SE_05_03_HOLDER_MAINHOLES(totalHeight){
//holes
    OOBBHole3D(1,1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-1,1*OOBBSpacing-1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-2,1*OOBBSpacing-2);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-3,1*OOBBSpacing-3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-4,1*OOBBSpacing-4);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-5,1*OOBBSpacing-5);
    
    
    OOBBHole3D(1,3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-1,3*OOBBSpacing+1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-2,3*OOBBSpacing+2);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-3,3*OOBBSpacing+3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-4,3*OOBBSpacing+4);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-5,3*OOBBSpacing+5);
    
    /*
    OOBBHole3D(3,1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,1*OOBBSpacing-1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,1*OOBBSpacing-2);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,1*OOBBSpacing-3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,1*OOBBSpacing-4);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,1*OOBBSpacing-5);
    
    
    OOBBHole3D(3,3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,3*OOBBSpacing+1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,3*OOBBSpacing+2);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,3*OOBBSpacing+3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,3*OOBBSpacing+4);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing,3*OOBBSpacing+5);
    */
    /*
    
    
    OOBBInsertItemCoord("OOBBHole",4,1);
    OOBBInsertItemCoord("OOBBHole",4,3);
    
    
    //OOBBInsertItemCoord("OOBBHole",2,3);
    OOBBInsertItemCoord("OOBBHole",5,3);
    //OOBBInsertItemCoord("OOBBHole",4,3);
    
    //OOBBInsertItemCoord("OOBBHole",2,1);
    OOBBInsertItemCoord("OOBBHole",5,1);
    //OOBBInsertItemCoord("OOBBHole",4,1);
    
    
    OOBBInsertItemCoord("OOBBHole",5,2);
    
    
    
}




module OOBB_HL_SE_05_03_HOLDER_BEARINGHOLE(bearingSize,totalHeight){
    if(bearingSize == 6704){
        OOBBInsertItemCoord("Bearing6704Hold",2,2,totalHeight);    
    }else if(bearingSize == 6803){
        OOBBInsertItemCoord("Bearing6803Hold",2,2,totalHeight);    
    }
}


module OOBB_HL_SE_05_03_HOLDER_CAPTIVENUTS(bearingSize,capHeight){
    nutHeight = OOBBNutM3Height;
    nutGap = nutHeight;
    //Servo Low
   
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight-2);
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight); //to allow for using 30mm bolts      
    //Servo High
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight);
    //to allow for using 30mm bolts
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight-2); 
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight); //Retaining Screws
    OOBBInsertItemMM("M3SocketHead",3*OOBBSpacing+2,2*OOBBSpacing,height=capHeight);      
    OOBBInsertItemMM("M3SocketHead",1*OOBBSpacing-2,2*OOBBSpacing,height=capHeight);      
    
    

    
}

///########
///########
///########  BRACKET
///########
module OOBB_HL_SE_05_03_BRACKET(bearingSize){
	difference(){
        translate([-4*OOBBSpacing,-2*OOBBSpacing,0]){
            difference(){
                OOBBPLOutline3D(5,3,servoBracketThicknessFull);
                translate([6*OOBBSpacing,0,0]){
                    mirror([1,0,0]){
                    
                        OOBB_HL_SE_05_03_HOLDER_MAINHOLES(30);
                    }
                }
            }          
        }
            OOBBInsertItemCoord("ServoFullMountTop",0  ,0,height=12);
            OOBBInsertItemMM("M3Slot",0*OOBBSpacing,1*OOBBSpacing+2);
            OOBBInsertItemMM("M3Slot",0*OOBBSpacing,-1*OOBBSpacing-2);
        
            
	}
}


///########
///########
///########  SERVOHORN
///########

	
botTubeHeightFull=7;
topTubeHeightFull = 4;
	
module OOBB_HL_SE_05_03_SERVOHORN(bearingSize){

	bearingTubeHeight = bearingSize==6803 ? 5 : 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
	bearingLittle = bearingSize==6803 ? OOBBBearing6803Little : OOBBBearing6704Little;
    totalHeight = botTubeHeightFull+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19
	
    topHeight = topTubeHeightFull + 9; //9 is wheel width
    bottomHeight = botTubeHeightFull + bearingTubeHeight;
        
    
    
        //TOP PIECE
    //translate([0,0,0]){
    translate([0,0,topHeight/2]){  //move to zero height
        rotate([0,180,0]){ //rotate 180 to print upside down
            translate([0,0,-bottomHeight - topHeight/2]){ //shift so centred for flip
                difference(){
                    union(){
                        //bottomTube
                        
                        
                        //topTube
                        translate([0,0,botTubeHeightFull+bearingTubeHeight+topTubeHeightFull/2  ]){
                            //cylinder(topTubeHeight,bearingLittle-0.5,bearingLittle-0.5,true);
                            cylinder(topTubeHeightFull,bearingInside+1,bearingInside+1,true);
                        }
                        //wheel
                        translate([0,0,totalHeight]){
                            rotate([0,180,0]){
                                OOBB_WH_SOLID(3);
                            }
                        }
                               //bearing tube
                        translate([0,0,botTubeHeightFull+bearingTubeHeight/2  ]){
                            cylinder(bearingTubeHeight,bearingInside,bearingInside,true);
                            } 
                    }
                    OOBB_HL_SE_05_03_SERVOHORN_HOLES(bearingSize);
                }
            }
        }

    }
    
        // BOTTOM PIECE
    //translate([0,0,0]){
    translate([0,-OOBBSpacing*2-3,7]){
        rotate([0,180,0]){//rotate 180 to print upside down
            difference(){
                union(){
                    
                    translate([0,0,0]){
                        //OOBBcylinder(botTubeHeightFull,bearingLittle-0.5,bearingLittle-0.5);
                        OOBBcylinder(botTubeHeightFull,bearingInside+1,bearingInside+1);
                    }
                    //bearingTube    
                    
                    
                    
                    
                    
                }
                OOBB_HL_SE_05_03_SERVOHORN_HOLES(bearingSize);
            }
        }
    }    
	
}

module OOBB_HL_SE_05_03_SERVOHORN_HOLES(bearingSize){
    OOBB_screwClamp1X = 0; 
    OOBB_screwClamp2X = 0;
    OOBB_screwClamp1Y = 8.125;
    OOBB_screwClamp2Y = -8.125;
	
    
    
	bearingTubeHeight = bearingSize==6803 ? 5 : 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = bearingSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
	bearingLittle = bearingSize==6803 ? OOBBBearing6803Little : OOBBBearing6704Little;
    totalHeight = botTubeHeightFull+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19

		OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
		OOBBInsertItemCoord("OOBBHole",0,0,height=4);
		
		
	//for tg90
	//OOBBInsertItemCoord("ServoMicroHornCatchSingleBottomInsertion",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
	//for continuousRotation
    OOBBInsertItemCoord("ServoFullHornCatchBottomInsertion",0,0,5.75); 
    
    
        //clamping screws
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp1X,OOBB_screwClamp1Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp1X,OOBB_screwClamp1Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp1X,OOBB_screwClamp1Y,OOBBNutM3Height);
        
        
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp2X,OOBB_screwClamp2Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp2X,OOBB_screwClamp2Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp2X,OOBB_screwClamp2Y,OOBBNutM3Height);
}
*/


if(m=="CN-BAS2-05-05"){
    CN_BAS2_05_05(w,h);
}



module CN_BAS2_05_05(width,height){
    //bottom
    
    echo("Building CN-BA2-05-05");
    if(extra == "BOTTOM"){
        depth=6;
        difference(){
            oi("oobbBase",width=width,height=height,depth=depth);
            plateThick=2;
            oi("buttonM7",x=-15,y=-25,z=-plateThick,rad=1);
            oi("buttonM7",x=15,y=-25,z=-plateThick,rad=1);
            oi("ooebWIMOT",x=-36,y=-15,rotZ=0);
            oi("ooebWIMOT",x=36,y=-15,rotZ=180);
            //wiring hole
            oi("holeM10",x=5,y=-15);
            oi("holeM10",x=-5,y=-15);
            oi("holeM10",x=0,y=-15);
            oi("batteryAAASINGTH",x=0,y=0,z=-plateThick,rad=2);
            oi("batteryAAASINGTH",x=0,y=15,z=-plateThick,rad=2);
            oi("batteryAAASINGTH",x=0,y=30,z=-plateThick,rad=2);
            //oobb holes
            oi("holeM6",y=30,x=-30);
            oi("holeM6",y=15,x=-30);
            oi("holeM6",y=0,x=-30);
            //oi("holeM6",y=-15,x=-30);
            oi("holeM6",y=-30,x=-30);
            oi("holeM6",y=30,x=30);
            oi("holeM6",y=15,x=30);
            oi("holeM6",y=0,x=30);
            //oi("holeM6",y=-15,x=30);
            oi("holeM6",y=-30,x=30);
        }
    }
    //top
    if(extra == "TOP"){
        difference(){
            depth=2;
            oi("oobbBase",width=width,height=height,depth=depth);
            oi("holeM7",x=-15,y=-25);
            oi("holeM7",x=15,y=-25);
            //oi("ooebWIMOT",x=-36,y=-15,rotZ=0);
            //oi("ooebWIMOT",x=36,y=-15,rotZ=180);
            //wiring hole
            oi("holeM10",x=5,y=-15);
            oi("holeM10",x=-5,y=-15);
            oi("holeM10",x=0,y=-15);
            oi("batteryAAASINGTH",x=0,y=0,z=-100);
            oi("batteryAAASINGTH",x=0,y=15,z=-100);
            oi("batteryAAASINGTH",x=0,y=30,z=-100);
            //oobb holes
            oi("holeM6",y=30,x=-30);
            oi("holeM6",y=15,x=-30);
            oi("holeM6",y=0,x=-30);
            //oi("holeM6",y=-15,x=-30);
            oi("holeM6",y=-30,x=-30);
            oi("holeM6",y=30,x=30);
            oi("holeM6",y=15,x=30);
            oi("holeM6",y=0,x=30);
            //oi("holeM6",y=-15,x=30);
            oi("holeM6",y=-30,x=30);
        }
    }    
}

if(m=="HL-N20-03-03"){
    HL_N20_03_03(w,h);
}if(m=="HL-GM1-03-03"){
    HL_GM1_03_03(w,h);
}if(m=="HL-RC-03-03"){
    HL_RC_03_03(w,h);
}if(m=="HL-CN-03-03"){
    HL_CN_03_03(w,h);
}

module HL_N20_03_03(width,height){
    depth=12;
    echo("Building HL-N20-03-03");
    difference(){
        oi("oobbBase",width=width,height=height,depth=depth);
        oi("n20Motor",x=0,y=0,z=-2,rotZ=90);
        //nut cutouts for clearance
        //oi("cube",x=-15,width=15,height=100,depth=6);
        //oi("cube",x=15,width=15,height=100,depth=6);
        //oobb holes
        oi("holeM6",x=15,y=0);
        oi("holeM6",x=15,y=15);
        oi("holeM6",x=15,y=-15);
        oi("holeM6",x=-15,y=0);
        oi("holeM6",x=-15,y=15);
        oi("holeM6",x=-15,y=-15);
        oi("holeM6",x=0,y=15);
        oi("holeM6",x=0,y=-15);
    }
}

module HL_GM1_03_03(width,height){
    
    echo("Building HL-GM1-03-03");
    wiringWidth = 35;
    wiringHeight = 13;
    wiringDepth = 4;
    shift = 4;
    space = 0.25;
    plateThickness = 2.5;
    join = 9;
    topDepth=plateThickness+join; //plate thickness, plus distance to tab plus thickness of tab, plus nut height
    botDepth=plateThickness+gv("GMOT-01-DEPTH")-join;
    bottomLevel=-gv("GMOT-01-DEPTH");
    //sizing cube
    //oi("cube",width=70,height=3,depth=25,z=plateThickness);
    if(extra=="NONE" || extra=="TOP"){
        difference(){
            //base plate
            union(){
                oi("oobbBase",width=width,height=height,depth=topDepth,z=plateThickness);
                oi("oobbBase",x=-shift,width=width,height=height,depth=topDepth,z=plateThickness);
                //oi("oobbBase",y=-shift,width=width,height=height,depth=depth,z=plateThickness);
                //oi("oobbBase",x=-shift,y=-shift,width=width,height=height,depth=depth,z=plateThickness);
            }
            HL_GM1_03_03_HOLES(join=join,plateThickness=plateThickness);
            }
        }
    if(extra=="NONE" || extra=="BOTTOM"){
        difference(){
            //base plate
            union(){
                oi("oobbBase",width=width,height=height,depth=botDepth,z=bottomLevel+gv("GMOT-01-DEPTH")-join);
                oi("oobbBase",x=-shift,width=width,height=height,depth=botDepth,z=bottomLevel+gv("GMOT-01-DEPTH")-join);
                
                //oi("oobbBase",y=-shift,width=width,height=height,depth=depth,z=plateThickness);
                //oi("oobbBase",x=-shift,y=-shift,width=width,height=height,depth=depth,z=plateThickness);
            }
            HL_GM1_03_03_HOLES(join=join,plateThickness=plateThickness);
            }
        }
            
}

module HL_GM1_03_03_HOLES(width,height,join,plateThickness){
    bottomLevel=-gv("GMOT-01-DEPTH");
    oi("gearMotor1",ex=plateThickness,rad=0,rotZ=0);
    //oobb holes
    oi("cylinder",rad=gv("NUTM3WIDTH")/2+0.5,x=gv("GMOT-01-HOLE1X"),y=gv("GMOT-01-HOLE1Y"),z=-9-3,depth=3);
    oi("nutM3",x=gv("GMOT-01-HOLE2X"),y=gv("GMOT-01-HOLE2Y"),z=-gv("GMOT-01-DEPTH"),depth=5);
    oi("nutM3",x=gv("GMOT-01-HOLE3X"),y=gv("GMOT-01-HOLE3Y"),z=-gv("GMOT-01-DEPTH"),depth=5);
    //joiner
    oi("holeM3",x=0,y=17);
    oi("countersunkM3",x=0,y=17,z=plateThickness);
    oi("nutM3",x=0,y=17,z=bottomLevel);

    oi("holeM3",x=0,y=-17);
    oi("countersunkM3",x=0,y=-17,z=plateThickness);
    oi("nutM3",x=0,y=-17,z=bottomLevel);
                        
            
    oi("holeM6",x=15,y=15);
    oi("holeM6",x=15,y=15);
    oi("holeM6",x=15,y=-15);
    oi("holeM6",x=-15,y=15);
    //oi("holeM6",x=-15,y=-15);
          
    //wiring      
    oi("WI-M2",x=-42/2-4,y=-1.5-1.5-gv("GMOT-01-HEIGHT")/2,z=-join,rotX=90);    
    w = 30;
    h=2.5;
    oi("cube",width=w,height=h,depth=3,x=-42/2-4+w/2,y=-gv("GMOT-01-HEIGHT")/2-h/2,z=-gv("GMOT-01-DEPTH")+3);
    oi("cube",width=3,height=h,depth=15,x=4,y=-gv("GMOT-01-HEIGHT")/2-h/2,z=-gv("GMOT-01-DEPTH")+15);
}


//45 degree model
module HL_GM1_03_03_OLD01(width,height){
    depth=18;
    echo("Building HL-GM1-03-03");
    wiringWidth = 35;
    wiringHeight = 13;
    wiringDepth = 4;
    space = 0.25;
    if(extra=="NONE" || extra=="BASE"){
        difference(){
            union(){
                shift = 4;
                plateThickness = 2;
                oi("oobbBase",width=width,height=height,depth=depth,z=plateThickness);
                oi("oobbBase",x=-shift,width=width,height=height,depth=depth,z=plateThickness);
                oi("oobbBase",y=-shift,width=width,height=height,depth=depth,z=plateThickness);
                oi("oobbBase",x=-shift,y=-shift,width=width,height=height,depth=depth,z=plateThickness);
            }
            
            oi("gearMotor1",ex=2,rad=0,rotZ=45);
            #oi("gearMotor1",rad=0,rotZ=45,z=-2);
            oi("gearMotor1",rad=0,rotZ=45,z=-4);
            //oobb holes
            //oi("holeM6",x=15,y=0);
            oi("holeM6",x=15,y=15);
            oi("holeM6",x=15,y=-15);
            //oi("holeM6",x=-15,y=0);
            oi("holeM6",x=-15,y=15);
            //oi("holeM6",x=-15,y=-15);
            //oi("holeM6",x=0,y=15);
            //oi("holeM6",x=0,y=-15);
            //wiring hole
            // wiring
                rotate([0,0,45]){
                    oi("cube",width=wiringWidth+space,height=wiringDepth+space,depth=wiringHeight+space,x=-10-space/2,y=-21.5/2-wiringDepth/2-space/2,z=0);
                }
            }
        }
    if(extra=="NONE" || extra=="WIRINGBLOCK"){
            
        //wiring block
        translate([50,0,0]){
            difference(){
                oi("cube",width=wiringWidth,height=wiringHeight,depth=wiringDepth);
               oi("ooebWIMOT",x=-wiringWidth/2,y=1.4,z=0,rotZ=0);
                    //wire route
                oi("cube",width=30,height=1.5,depth=2,x=-3,y=-5.75,z=0);
                oi("cube",width=3,height=8,depth=2,x=10.5,y=-2,z=0);
                }
        }
    }
}

module HL_RC_03_03(width,height){
    depth=12;
    echo("Building HL-RC-03-03");
    difference(){
        union(){
            translate([0,0,-3]){
                WI_BP_03_03_BA(width,height);
            }
            WI_BP_03_03_BA(width,height);
            
            oi("oobbBase",x=0,y=-10,z=2.25,width=3,height=1.25,depth=4,rotX=90);
        }
       oi("holeM8",x=0,y=8);
       oi("RC-RECEIVER",rotX=90,z=25);

    }
}

module HL_CN_03_03(width,height){
    depth=12;
    echo("Building HL-CN-03-03");
    difference(){
        oi("oobbBase",width=width,height=height,depth=12);
        oi("nutM3",y=0,x=gv("OS1"),z=-(depth-gv("NUTM3HEIGHT")),depth=gv("NUTM3HEIGHT"));
        oi("nutM3",y=0,x=-gv("OS1"),z=-(depth-gv("NUTM3HEIGHT")),depth=gv("NUTM3HEIGHT"));
        //central hole
        oi("cube",width=24,height=24,depth=9);
        oi("DCJP-21D-X-THTH-01",x=0,y=14.1,z=0,rotZ=90,rotX=180);
        oi("ooebWIMOThole",x=-7.5,y=-15.805+3,z=0);
        oi("ooebWIMOThole",x=-7.5,y=-15.805,z=-gv("I011"));
        oi("ooebWIMOThole",x=7.5,y=-15.805+3,z=0);
        oi("ooebWIMOThole",x=7.5,y=-15.805,z=-gv("I011"));
        WI_holes();
    }
}if(m=="TEST-OOEBWIMOT-05-05"){
    TEST_OOEBWIMOT_05_05(w,h);
}
if(m=="TEST-GM1SHAFT-05-05"){
    TEST_GM1SHAFT_05_05(w,h);
}
if(m=="TEST-N20SHAFT-05-05"){
    TEST_N20SHAFT_05_05(w,h);
}

module TEST_OOEBWIMOT_05_05(width,height){
    //bottom
    
    echo("Building TEST-OOEBWIMO-05-05");
        depth=6;
        difference(){
            union(){
            oi("oobbBase",width=width,height=height,depth=depth);
            oi("oobbBase",y=5,width=width,height=height,depth=depth);
            oi("oobbBase",y=-5,width=width,height=height,depth=depth);
            }
            //clearance
            oi("ooebWIMOT",x=-36,y=30,width=width,height=height,depth=depth,ex=0.1,rad=0);
            oi("ooebWIMOT",x=-36,y=15,width=width,height=height,depth=depth,ex=0.2,rad=0);
            oi("ooebWIMOT",x=-36,y=0,width=width,height=height,depth=depth,ex=0.3,rad=0);
            oi("ooebWIMOT",x=-36,y=-15,width=width,height=height,depth=depth,ex=0.4,rad=0);
            oi("ooebWIMOT",x=-36,y=-30,width=width,height=height,depth=depth,ex=0.5,rad=0);
            //height
            stan = 0.2;
            oi("ooebWIMOT",x=36,y=30,width=width,height=height,depth=depth,ex=stan,rad=0.1,rotZ=180);
            oi("ooebWIMOT",x=36,y=15,width=width,height=height,depth=depth,ex=stan,rad=0.2,rotZ=180);
            oi("ooebWIMOT",x=36,y=0,width=width,height=height,depth=depth,ex=stan,rad=0.3,rotZ=180);
            oi("ooebWIMOT",x=36,y=-15,width=width,height=height,depth=depth,ex=stan,rad=0.4,rotZ=180);
            oi("ooebWIMOT",x=36,y=-30,width=width,height=height,depth=depth,ex=stan,rad=0.5,rotZ=180);
        }
    
}

module TEST_N20SHAFT_05_05(width,height){
    //bottom
    
    echo("Building TEST-GM1SHAFT-05-05");
    base=3;
    bump=6;
    difference(){
        union(){
            oi("oobbBase",width=width,height=height,depth=base,z=0);
            oi("cylinder",rad=10/2,x=-20,y=-20,depth=6,z=6);
            oi("cylinder",rad=10/2,x=-20,y=0,depth=6,z=6);
            oi("cylinder",rad=10/2,x=-20,y=20,depth=6,z=6);
            oi("cylinder",rad=10/2,x=20,y=-20,depth=6,z=6);
            oi("cylinder",rad=10/2,x=20,y=0,depth=6,z=6);
            oi("cylinder",rad=10/2,x=20,y=20,depth=6,z=6);
        }            
        oi("n20Shaft",x=-20,y=-20,z=12,rad=0);
        oi("n20Shaft",x=-20,y=0,z=12,rad=0.1);
        oi("n20Shaft",x=-20,y=20,z=12,rad=0.2);
        oi("n20Shaft",x=20,y=-20,z=12,rad=0.3);
        oi("n20Shaft",x=20,y=0,z=12,rad=-0.4);
        oi("n20Shaft",x=20,y=20,z=12,rad=0.5);
    }
}


    module WH_03_GM1(width){
    extr=15;
    difference(){
        union(){
            OOBB_WH_SOLID(width);
            
            oi("cylinder",rad=17/2,depth=extr,z=extr);
        }
        oi("gearMotor1Shaft",x=0,y=0,z=extr,rad=0.175,depth=15,ex=extr);
        //oi("gearMotor1Shaft",x=0,y=0,rad=0.15,ex=0,rotX=180);
    }
    
}


module WH_03_N20(width){
    difference(){
        union(){
            OOBB_WH_SOLID(width);
            extr=15;
            oi("cylinder",rad=10/2,depth=extr,z=extr);
        }
        oi("n20Shaft",x=0,y=0,rad=0.1);
    }
}
//WI
if(m=="WI-M2-03-03"){
    WI_M2_03_03(w,h);
}
if(m=="WI-BA-03-03"){
    WI_BA_03_03(w,h);
}
if(m=="WI-HV-03-03"){
    WI_HV_03_03(w,h);
}
if(m=="WI-SM-03-03"){
    WI_SM_03_03(w,h);
}
if(m=="WI-BP-03-03-CS"){
    WI_BP_03_03_CS(w,h);
}
if(m=="WI-BP-03-03-NU"){
    WI_BP_03_03_NU(w,h);
}
if(m=="WI-BP-03-03-BA"){
    WI_BP_03_03_BA(w,h);
}
if(m=="WI-BP-03-03-BAH"){
    WI_BP_03_03_BAH(w,h);
}
if(m=="WI-BP-03-03-BAN"){
    WI_BP_03_03_BAN(w,h);
}

module WI_M2_03_03(width,height){
    echo("Building WI-M2-03-03");
    difference(){
        WI_XX_03_03(width,height);
        oi("WI-M2",x=0,y=-21,z=00,depth=100,rotZ=90);
    }
}

module WI_BA_03_03(width,height){
    echo("Building WI-BA-03-03");
    difference(){
        WI_XX_03_03(width,height);
        oi("WI-BA",x=0,y=-21,z=00,depth=100,rotZ=90);
    }
}

module WI_HV_03_03(width,height){
    echo("Building WI-HV-03-03");
    difference(){
        WI_XX_03_03(width,height);
        oi("WI-HV",x=0,y=-21,z=00,depth=100,rotZ=90);
    }
}

module WI_SM_03_03(width,height){
    echo("Building WI-SM-03-03");
    difference(){
        WI_XX_03_03(width,height);
        oi("WI-SM",x=0,y=-21,z=00,depth=100,rotZ=90);
    }
}

module WI_BP_03_03_CS(width,height){
    echo("Building WI-BP-03-03");
    difference(){
        WI_XX_03_03(width,height,hole=false);
        oi("countersunkM3",x=gv("OS1"),y=0);
        oi("countersunkM3",x=-gv("OS1"),y=0);
    }
}


module WI_BP_03_03_NU(width,height){
    echo("Building WI-BP-03-03");
    difference(){
        WI_XX_03_03(width,height,hole=false);
        oi("nutM3",x=gv("OS1"),y=0,depth=2);
        oi("nutM3",x=-gv("OS1"),y=0,depth=2);
    }
}


module WI_BP_03_03_BA(width,height){
    echo("Building WI-BP-03-03");
    difference(){
        WI_XX_03_03(width,height,hole=false);
        //oi("countersunkM3",x=gv("OS1"),y=0);
        //oi("countersunkM3",x=-gv("OS1"),y=0);
    }
}

module WI_BP_03_03_BAN(width,height){
    echo("Building WI-BP-03-03");
    difference(){
        WI_XX_03_03(width,height,hole=false);
        oi("nutM3",x=gv("OS1"),y=0,depth=2.5);
        oi("nutM3",x=-gv("OS1"),y=0,depth=2.5);
    }
}

module WI_BP_03_03_BAH(width,height){
    echo("Building WI-BP-03-03");
    difference(){
       WI_BP_03_03_BA(width,height);
       oi("holeM8",x=0,y=8);
    } 
}

module WI_XX_03_03(width,height,hole=true){
    depth=3;
    difference(){
        oi("oobbBase",width=width,height=height,depth=depth);
        if(hole){
            oi("holeM8",x=0,y=8);
        }
        WI_holes();
        }    
}

module WI_holes(){
    oi("holeM3",x=gv("OS1"),y=0);
    oi("holeM3",x=-gv("OS1"),y=0);
    oi("holeM6",x=gv("OS1"),y=-gv("OS1"));
    oi("holeM6",x=-gv("OS1"),y=-gv("OS1"));
    oi("holeM6",x=gv("OS1"),y=gv("OS1"));
    oi("holeM6",x=-gv("OS1"),y=gv("OS1"));
}

// For inserting TAXA items
// ex used for items with mounting screws to control height of countersunk screw heads
// rad used for extra clearance around items
module OOBBInsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,color="gray",alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    if(item == "hexIDHoles" || item=="led100wHoles"){
        holeSpacing = 34;
        oi("holeM3",x=-holeSpacing/2,y=-holeSpacing/2);
        oi("holeM3",x=holeSpacing/2,y=holeSpacing/2);
        oi("holeM3",x=-holeSpacing/2,y=holeSpacing/2);
        oi("holeM3",x=holeSpacing/2,y=-holeSpacing/2);
    }
    else if(item == "hexIDHole" || item=="pocketMagnifierHole"){
        oi("cube",width=80,height=43,depth=100,z=50);
    }
    else if(item == "hexIDN20" || item=="n20Motor"){
        //motor
        oi("cube",width=12+2,height=10+2,depth=30,z=0);
//        //shaft
        oi("cylinder",rad=5/2,depth=10,z=10);
        //screw holes
        oi("cylinder",rad=holeM16D,x=4.5,z=10,depth=10);
        oi("cylinder",rad=holeM16D,x=-4.5,z=10,depth=10);
        
    }
    else if(item == "hexIDGearMotor2" || item=="gearMotor2" || item=="GMOT-01"){
        //motor
        oi("cube",x=-21.5,width=65+rad,height=22.5+rad,depth=21,z=0);
        oi("cube",x=13.5,width=5+rad,height=6+rad,depth=3+rad,z=-11+rad/2);
        //shaft (7 diameter)
        //shaft clearance
        oi("cylinder",rad=20/2,depth=33,z=6);
        //extra clearance hole a few shifted to get it smoother
        oi("cylinder",x=-11,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11+1,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11+2,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11+3,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11+4,rad=5/2,depth=33,z=3);
        
        oi("holeM3",x=13.5,y=0);
        oi("holeM3",x=-20,y=9);
        oi("holeM3",x=-20,y=-9);
        if(ex != 0){
            oi("countersunkM25D",x=13.5,y=0,z=ex);
            oi("countersunkM25D",x=-20,y=9,z=ex);
            oi("countersunkM25D",x=-20,y=-9,z=ex);
        }
        //shaft
    }
    else if(item == "hexIDGearMotor1" || item=="gearMotor1" || item=="GMOT-02"){
        //motor
        oi("cube",x=-21,width=gv("GMOT-01-WIDTH")+rad,height=gv("GMOT-01-HEIGHT")+rad,depth=gv("GMOT-01-DEPTH"),z=0);
        oi("cube",x=14,width=5+rad,height=5+rad,depth=3+rad,z=-9+rad/2);
        //shaft (7 diameter)
        //shaft clearance
        oi("cylinder",rad=20/2,depth=33,z=6);
        //extra clearance hole a few shifted to get it smoother
        oi("cylinder",x=-11.25,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11.25+1,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11.25+2,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11.25+3,rad=5/2,depth=33,z=3);
        oi("cylinder",x=-11.25+4,rad=5/2,depth=33,z=3);
        oi("holeM3",x=13.5,y=0,z=250-12);
        oi("holeM3",x=-20,y=9);
        oi("holeM3",x=-20,y=-9);
        if(ex != 0){
            oi("countersunkM3",x=13.5,y=0,z=ex);
            oi("countersunkM3",x=-20,y=9,z=ex);
            oi("countersunkM3",x=-20,y=-9,z=ex);
        }
        //shaft
    }
    else if(item == "hexIDGearMotor1Shaft" || item=="gearMotor1Shaft"){
        //shaft
        chamfer=2;
        union(){
            default = 0;
            //shaft
            //difference(){
                od=5.5+rad+default;                
                cutout=1;
                difference(){
                    //main Shaft
                    union(){
                        oi("cylinder",rad=(od)/2,depth=depth);
                        //cone for bezel
                        oi("cone",rad=od/2,rad2=od/2+chamfer/2,depth=chamfer);
                        oi("cone",rad2=od/2,rad=od/2+chamfer/2,depth=chamfer,z=-depth+chamfer);
                    }
                    //flat sides
                    union(){
                        //get the long side of the triangle for the cutout
                        cutoutSide=sqrt((chamfer)*(chamfer)+(chamfer)*(chamfer));
                        difference(){
                            //flat side positive
                            oi("cube",width=cutout*2,height=od,x=od/2,depth=depth);
                            //wedge cutout
                            #oi("cube",x=1.75,y=-od/2,width=cutoutSide,height=cutoutSide,depth=od,rotX=90,rotY=45);
                            oi("cube",x=1.75,y=-od/2,width=cutoutSide,height=cutoutSide,depth=od,rotX=90,rotY=45,z=-depth);
                        }
                        difference(){
                            //flat side positive
                            oi("cube",width=cutout*2,height=od,x=-od/2,depth=depth);
                            //wedge cutout
                            #oi("cube",x=-1.75,y=-od/2,width=cutoutSide,height=cutoutSide,depth=od,rotX=90,rotY=45);
                            oi("cube",x=-1.75,y=-od/2,width=cutoutSide,height=cutoutSide,depth=od,rotX=90,rotY=45,z=-depth);
                        }
                    }
                }
                //
                /*
                difference(){
                    union(){
                        
                        }
                    //main flat side
                    //top chamfer
                    intersection(){
                        oi("cone",rad=od/2,rad2=od/2+chamfer/2,depth=chamfer);
                        }
                    intersection(){
                        oi("cone",rad=od/2,rad2=od/2+chamfer/2,depth=chamfer);
                        oi("cube",x=-1.75,y=-od/2,width=2.828,height=2.828,depth=od,rotX=90,rotY=45);
                    }
                }
                */
            //}
            //cutout square
            oi("cube",width=7.5,height=1.5,x=3.75,depth=depth);
            //clearance hoop
            difference(){
                //big cyulinder
                oi("cylinder",rad=17/2,depth=depth);
                //little cylinder
                
                //trying smaller
                oi("cylinder",rad=11/2,depth=depth);
                oi("cube",width=7,height=20,depth=depth,x=-5.9);
            }
            
        }
        
        
    }else if(item == "hexIDGearMotor2Shaft" || item=="gearMotor2Shaft"){
        //shaft
        union(){
            default = 0;
            //shaft
            difference(){
                oi("cylinder",rad=(7+rad+default)/2,depth=100,z=50);
                oi("cube",width=2.1,height=7,x=3.45+rad+default,depth=100,z=50);
                oi("cube",width=2.1,height=7,x=-3.45-rad-default,depth=100,z=50);
            }
            //cutout square
            oi("cube",width=7.5,height=1.5,x=3.75,depth=100,z=50);
            //clearance hoop
            difference(){
                //big cyulinder
                oi("cylinder",rad=17/2,depth=100,z=50);
                //little cylinder
                //oi("cylinder",rad=13/2,depth=100,z=50);
                //trying smaller
                oi("cylinder",rad=11/2,depth=100,z=50);
                oi("cube",width=7,height=20,depth=100,z=50,x=-5.9);
            }
        }
        
        
    }
    else if(item == "hexIDN20Shaft" || item=="n20Shaft"){
        //shaft
        union(){
            default = 0;
            //shaft
            shaftOD = 3;
            //flat offset
            flatOffset= 0.5;
            //cutout
            cutout = 1;
            difference(){
                oi("cylinder",rad=(shaftOD+rad+default)/2,depth=100,z=50);
                oi("cube",width=2,height=3,x=shaftOD/2+1-flatOffset,depth=100,z=50);                
            }
            //cutout square
            oi("cube",width=shaftOD+3,height=cutout,x=2,depth=100,z=50);
            //clearance hoop
            difference(){
                //big cylinder
                oi("cylinder",rad=(shaftOD+7)/2,depth=100,z=50);
                //little cylinder
                //oi("cylinder",rad=13/2,depth=100,z=50);
                //trying smaller
                oi("cylinder",rad=(shaftOD+5)/2,depth=100,z=50);
                oi("cube",width=7,height=20,depth=100,z=50,x=-5.9);
            }
        }
        
        
    }
    else if(item == "hexIDbuttonM7" || item=="buttonM7"){
        oi("cylinder",rad=holeM7,depth=11,z=11);
        oi("cylinder",rad=holeM10+rad,depth=18,z=0);
    }
    else if(item == "hexIDbatteryAAASINGTH" || item=="batteryAAASINGTH"){
        oi("cube",width=51+rad,height=13+rad,depth=13+rad);
        oi("holeM2",x=22.5);
        oi("holeM2",x=-22.5);
        
    }
    else if(item == "ooebWIMOT" ||  item == "WI-M2"){
        //ex = extra padding around
        //rad = extra height
        if(ex == 0 && rad == 0){
            //dep=2.54+ 0.06;
            dep=3;
            ext=0.1;
            union(){
                oi("cube",x=11.27,y=0,width=22.54+ext,height=5.08+ext,depth=dep);
                oi("cube",x=7.27,y=0,width=2.54+ext,height=10.16+ext,depth=dep);
                oi("cube",x=25.77,y=0,width=6.46+ext,height=3.08+ext,depth=dep);
            }
        }else{
            dep=2.54+ rad;
            ext=ex;
            echo("TEST");
            union(){
                oi("cube",x=11.27,y=0,width=22.54+ext,height=5.08+ext,depth=dep);
                oi("cube",x=7.27,y=0,width=2.54+ext,height=10.16+ext,depth=dep);
                oi("cube",x=25.77,y=0,width=6.46+ext,height=3.08+ext,depth=dep);
            }
        }
    }else if(item == "ooebWIMOThole"){
            oi("cube",width=gv("I012")+0.5,height=10.5,depth=gv("I011")+0.5);
    }else if(item == "WI-SM"){
        dep=3;
        ext=0.1;
        union(){
            oi("cube",x=11.27,y=0,width=22.54+ext,height=gv("I014")+ext,depth=dep); // main square
            oi("cube",x=7.27,y=0,width=gv("I011")+ext,height=gv("I016")+ext,depth=dep); // header holder 
            oi("cube",x=25.77,y=0,width=6.46+ext,height=gv("I014")-2+ext,depth=dep); //wire gap
                }
            }else if(item == "WI-HV"){
        dep=3;
        ext=0.1;
        union(){
            oi("cube",x=15.54,y=0,width=14+ext,height=gv("I012")+ext,depth=dep); // main square inside
            oi("cube",x=3,y=-gv("I011")/2,width=6+ext,height=gv("I013")+ext,depth=dep); // main square outside
            oi("cube",x=7.27,y=-gv("I011")/2,width=gv("I011")+ext,height=gv("I015")+ext,depth=dep); // header holder 
            oi("cube",x=25.77,y=0,width=6.46+ext,height=gv("I012")-2+ext,depth=dep); //wire gap
                }
            }else if(item == "WI-BA"){
        dep=3;
        ext=0.1;
        union(){
            oi("cube",x=15.54,y=0,width=14+ext,height=gv("I013")+ext,depth=dep); // main square inside
            oi("cube",x=3,y=-gv("I011")/2,width=6+ext,height=gv("I014")+ext,depth=dep); // main square outside
            oi("cube",x=7.27,y=-gv("I011")/2,width=gv("I011")+ext,height=gv("I016")+ext,depth=dep); // header holder 
            oi("cube",x=25.77,y=0,width=6.46+ext,height=gv("I013")-2+ext,depth=dep); //wire gap
                }
            }
        else if(item == "ooebWIMOT" ||  item == "WI-M2"){
        //ex = extra padding around
        //rad = extra height
        if(ex == 0 && rad == 0){
            //dep=2.54+ 0.06;
            dep=3;
            ext=0.1;
            union(){
                oi("cube",x=11.27,y=0,width=22.54+ext,height=5.08+ext,depth=dep);
                oi("cube",x=7.27,y=0,width=2.54+ext,height=10.16+ext,depth=dep);
                oi("cube",x=25.77,y=0,width=6.46+ext,height=3.08+ext,depth=dep);
            }
        }else{
            dep=2.54+ rad;
            ext=ex;
            echo("TEST");
            union(){
                oi("cube",x=11.27,y=0,width=22.54+ext,height=5.08+ext,depth=dep);
                oi("cube",x=7.27,y=0,width=2.54+ext,height=10.16+ext,depth=dep);
                oi("cube",x=25.77,y=0,width=6.46+ext,height=3.08+ext,depth=dep);
            }
        }
    }else if(item == "WI-SM"){
        dep=3;
        ext=0.1;
        union(){
            oi("cube",x=11.27,y=0,width=22.54+ext,height=gv("I014")+ext,depth=dep); // main square
            oi("cube",x=7.27,y=0,width=gv("I011")+ext,height=gv("I016")+ext,depth=dep); // header holder 
            oi("cube",x=25.77,y=0,width=6.46+ext,height=gv("I014")-2+ext,depth=dep); //wire gap
                }
            }else if(item == "WI-HV"){
        dep=3;
        ext=0.1;
        union(){
                oi("cube",x=15.54,y=0,width=14+ext,height=gv("I012")+ext,depth=dep); // main square inside
                oi("cube",x=3,y=-gv("I011")/2,width=6+ext,height=gv("I013")+ext,depth=dep); // main square outside
                oi("cube",x=7.27,y=-gv("I011")/2,width=gv("I011")+ext,height=gv("I015")+ext,depth=dep); // header holder 
                oi("cube",x=25.77,y=0,width=6.46+ext,height=gv("I012")-2+ext,depth=dep); //wire gap
                }
            }else if(item == "WI-BA"){
            dep=3;
            ext=0.1;
            union(){
                oi("cube",x=15.54,y=0,width=14+ext,height=gv("I013")+ext,depth=dep); // main square inside
                oi("cube",x=3,y=-gv("I011")/2,width=6+ext,height=gv("I014")+ext,depth=dep); // main square outside
                oi("cube",x=7.27,y=-gv("I011")/2,width=gv("I011")+ext,height=gv("I016")+ext,depth=dep); // header holder 
                oi("cube",x=25.77,y=0,width=6.46+ext,height=gv("I013")-2+ext,depth=dep); //wire gap
                }
            }else if(item == "RC-RECEIVER"){
                rcSpacingX=22;
                rcSpacingY=36;
                oi("holeM25D",x=rcSpacingX/2,y=-rcSpacingY/2,color=color);
                oi("holeM25D",x=-rcSpacingX/2,y=-rcSpacingY/2,color=color);
                oi("cube",width=27,height=42-12,depth=100,z=50);
                oi("cube",width=27-12,height=42,depth=100,z=50);
            }else if(item == "DCJA" || item == "DCJP-21D-X-THTH-01"){
                oi("cube",width=14,height=9,depth=11,z=11);
                oi("cube",width=11,height=15,depth=6,z=-5+11,x=-1.5);
            ///////////////
            // OOBB PARTS    
            }else if(item == "WH-03-GM1"){
                WH_03_GM1(width);
            }else if(item == "WH-03-N20"){
                WH_03_N20(width);
            }else{
                echo("NO OOBB ITEM");
            }
        }//######  OOBB OpenSCAD Generation  ######
//########################################
    
    
//######  OOBB OpenSCAD Generation  ######
//########################################
    
    
    
    
    /*    
    w=3;
    h=1;
    m="JA3D";
    */
    
    
    oi(m,width=w,height=h);     
    
    echo("#########################################");
    echo("######  OOBB Open SCAD Generation  ######");
    echo("");
    echo("     .:Generating:.");
    echo("            Mode; ", m, " Width: ", w, " Height: ", h, " Style: ", s);
    echo("");
//GLOBAL DIMENSIONS
    
if(m=="PL2D"){
    OOBBPL2D(w,h);
}else if(m=="PL3D"){
    OOBBPL3D(w,h,3);
}else if(m=="PL3DT"){
    OOBBPL3D(w,h,t);
}else if(m=="CP3D"){
    OOBBCP3D(w,h,12);
}else if(m=="JA2D"){
    OOBBJA2D(w,h);
}else if(m=="JA3D"){
    OOBBJA3D(w,h,12);
}else if(m=="CI2D"){
    OOBBCI2D(w);
}else if(m=="CI3D"){
    OOBBCI3D(w,3);
}

module OOBBPL3D(OOWidth,OOHeight,OOExtrude){
    difference(){
        OOBBPLOutline3D(OOWidth,OOHeight,OOExtrude);
        OOBBHolesFor3D(OOWidth,OOHeight);
    }

}


module OOBBCP3D(OOWidth,OOHeight,OOExtrude){
    difference(){
        OOBBPLOutline3DBig(OOWidth,OOHeight,OOExtrude);
        
        OOBBHolesForCP3D(OOWidth,OOHeight,9);
        
    }

}


module OOBBPL2D(OOWidth,OOHeight   ){
    difference(){
        OOBBPLOutline(OOWidth, OOHeight);
        OOBBHolesFor(OOWidth, OOHeight);    
    }
}

module OOBBCI3D(OOWidth,OOExtrude,middle=true){
    difference(){
        OOBBCIOutline3D(OOWidth,OOExtrude);
        OOBBHolesForCI3D(OOWidth,middle=middle);
    }

}

module OOBBCI2D(OOWidth){
    difference(){
        OOBBCIOutline(OOWidth);
        OOBBHolesForCI2D(OOWidth);
    }

}

module OOBBJA2D(OOWidth,OOHeight){
    OOBBJA2DBase(OOWidth,OOHeight);
}

module OOBBJA3D(OOWidth,OOHeight,OODepth){
    union(){
        difference(){
            linear_extrude(OODepth){
                OOBBJAOutline(OOWidth, OOHeight);
            }
            OOBBHolesFor3D(OOWidth,OOHeight);
            
            //all holes have nut2
            for(width = [1:OOWidth]){
                    OOBBJANut3D(width,12);
            }
        }
    }
}

module OOBBJA2DBase(OOWidth,OOHeight){
    difference(){
        OOBBJAOutline(OOWidth, OOHeight);
        OOBBHolesFor(OOWidth, OOHeight); 
        OOBBHolesForJA(OOWidth, OOHeight);        
    }   
}


module OOBBPLOutline3D(OOWidth,OOHeight,OODepth){
    
    if(s=="3DPR"){
        translate([0,0,OOBBfirstLayerLipDepth]){
            linear_extrude(OODepth-OOBBfirstLayerLipDepth){
                OOBBPLOutline(OOWidth, OOHeight);
            }
        }
        linear_extrude(OOBBfirstLayerLipDepth){
            OOBBPLOutlineFirstLayer(OOWidth, OOHeight);
        }
        
    }else{
        linear_extrude(OODepth){
            OOBBPLOutline(OOWidth, OOHeight);
        }
    }
    
}

module OOBBPLOutline3DBig(OOWidth,OOHeight,OODepth){
    extra=5;
    if(s=="3DPR"){
        translate([0,0,OOBBfirstLayerLipDepth]){
            linear_extrude(OODepth-OOBBfirstLayerLipDepth){
                OOBBPLOutlineBig(OOWidth, OOHeight,extra);
            }
        }
        linear_extrude(OOBBfirstLayerLipDepth){
            OOBBPLOutlineBigFirstLayer(OOWidth, OOHeight,extra);
        }
        
    }else{
        linear_extrude(OODepth){
            OOBBPLOutlineBig(OOWidth, OOHeight);
        }
    }
    
}


module OOBBCIOutline3D(OOWidth,OODepth){
    if(s=="3DPR"){
        translate([0,0,OOBBfirstLayerLipDepth]){
            linear_extrude(OODepth-OOBBfirstLayerLipDepth){
                OOBBCIOutline(OOWidth);
            }
        }
        linear_extrude(OOBBfirstLayerLipDepth){
            OOBBCIOutlineFirstLayer(OOWidth);
        }
        
    }else{
        linear_extrude(OODepth){
            OOBBCIOutline(OOWidth);
        }
    }
}

module OOBBCIOutline3DOLD(OOWidth,OODepth){
    linear_extrude(OODepth){
        OOBBCIOutline(OOWidth);
    }
}



module OOBBPLOutline3DComplete(wid3,hei3,OODepth){
    linear_extrude(OODepth){
        OOBBPLOutlineComplete(wid3, hei3);
    }
}

module OOBBHolesForJA(OOWidth, OOHeight){
    for(width = [2:OOWidth-1]){
            OOBBHoleBolt(width);
    }
}


module OOBBHolesFor(OOWidth, OOHeight){
    for(width = [1:OOWidth]){
        for(height = [1:OOHeight]){
            OOBBInsertItemCoord("OOBBHole2D",width,height);
        }
    }
}

module OOBBHolesFor3D(OOWidth, OOHeight){
            for(width = [1:OOWidth]){
                for(height = [1:OOHeight]){
                    OOBBHole3D(width,height);
                }
            }
}


module OOBBHolesForCP3D(OOWidth, OOHeight, level){
            for(width = [1:OOWidth]){
                for(height = [1:OOHeight]){
                    OOBBHole3DBig(width,height);
                            OOBBInsertItemCoord("M6NutCaptiveSingleBig",width,height,ooZ=level);
                }
            }
}

module OOBBHolesForCI3D(OOWidth,middle=true){
    
    if(OOWidth == 3){
        rotate([0,0,45]){
            OOBBHole3D(0,1);
            OOBBHole3D(0,-1);
            OOBBHole3D(-1,0);
            OOBBHole3D(1,0);
        }
    }
    
            for(height = [-(round(OOWidth/2)-1):round(OOWidth/2)-1]){
                for(width = [-(round(OOWidth/2)-1):round(OOWidth/2)-1]){
                    /*
                    //middle full rows
                    if(width == round(OOWidth/2) || height == round(OOWidth/2)){ 
                        OOBBHole3D(width,height);                        
                    }
                    */
                    CIcenter = 0;
                    CIradius = (OOWidth * OOBBSpacing - 3)/2;
                    CIheight = height * OOBBSpacing;
                    CIwidth = width * OOBBSpacing;
                    
                    buffer = 5.99;
                    rowHeight = -(round(OOWidth/2) * OOBBSpacing) + height * OOBBSpacing;
                    
                    CIwidthAtHeight = sqrt((CIradius*CIradius) - (CIheight * CIheight));
                    CIheightAtWidth = sqrt((CIradius*CIradius) - (CIwidth * CIwidth));
                    /*
                    echo();
                    echo();
                    echo();
                    echo("height  ",height);
                    echo("width  ",width);
                    echo("CIcente  ",CIcenter);
                    echo("CIradius  ",CIradius);
                    echo("CIheight  ",CIheight);
                    echo("CIwidthAtHeight  ",CIwidthAtHeight);
                    echo("CIheightAtWidth  ",CIheightAtWidth);
                    echo("width * OOBBSpacing  ",width * OOBBSpacing);
                    echo("rowHeight  ",rowHeight);
                    */
                    
                    if((CIwidthAtHeight - buffer) > abs(width * OOBBSpacing))  {
                        if((CIheightAtWidth - buffer) > abs(height * OOBBSpacing))  {
                            if(!middle && width == 0 && height == 0){
                                echo("SKIPPING MIDDLE HOLE");
                            }else{
                                OOBBHole3D(width,height);     
                                //echo("ADDING HOLE", middle, width, height);              
                            }
                        }    
                        
                    }
                    
                }
            }
            
            
            
            
            
}

module OOBBHolesForCI2D(OOWidth){
    //echo("#####################################################");
            for(height = [-(round(OOWidth/2)-1):round(OOWidth/2)-1]){
                for(width = [-(round(OOWidth/2)-1):round(OOWidth/2)-1]){
                    /*
                    //middle full rows
                    if(width == round(OOWidth/2) || height == round(OOWidth/2)){ 
                        OOBBHole3D(width,height);                        
                    }
                    */
                    CIcenter = 0;
                    CIradius = (OOWidth * OOBBSpacing - 3)/2;
                    CIheight = height * OOBBSpacing;
                    CIwidth = width * OOBBSpacing;
                    
                    buffer = 5.99;
                    rowHeight = -(round(OOWidth/2) * OOBBSpacing) + height * OOBBSpacing;
                    
                    CIwidthAtHeight = sqrt((CIradius*CIradius) - (CIheight * CIheight));
                    CIheightAtWidth = sqrt((CIradius*CIradius) - (CIwidth * CIwidth));
                    /*
                    echo();
                    echo();
                    echo();
                    echo("height  ",height);
                    echo("width  ",width);
                    echo("CIcente  ",CIcenter);
                    echo("CIradius  ",CIradius);
                    echo("CIheight  ",CIheight);
                    echo("CIwidthAtHeight  ",CIwidthAtHeight);
                    echo("CIheightAtWidth  ",CIheightAtWidth);
                    echo("width * OOBBSpacing  ",width * OOBBSpacing);
                    echo("rowHeight  ",rowHeight);
                    */
                    
                    if((CIwidthAtHeight - buffer) > abs(width * OOBBSpacing))  {
                        if((CIheightAtWidth - buffer) > abs(height * OOBBSpacing))  {
                        
                       OOBBInsertItemCoord("OOBBHole",width,height);                   
                        }    
                        
                    }
                    
                }
            }
}


module OOBBHole3D(OOx,OOy){
    height=50;    
    z=height-10;
    rad=OOBBHole;
    //OOBBHole3DRadiusComplete(OOx*OOBBSpacing,OOy*OOBBSpacing,rad,height,z);
    oi("holeM6",x=OOx*OOBBSpacing,y=OOy*OOBBSpacing);
}

module OOBBHole3DBig(OOx,OOy){
    height=50;    
    z=height-10;
    rad=OOBBHole+0.5;
    OOBBHole3DRadiusComplete(OOx*OOBBSpacing,OOy*OOBBSpacing,rad,height,z);
}





module OOBBHole3DRadius(x,y,rad){
    height=50;    
    z=height-10;
    OOBBHole3DRadiusComplete(x,y,rad,height,z);
}

module OOBBHole3DRadiusComplete(x,y,rad,height,z){    
   translate([x,y,z-height]){
       if(s=="3DPR"){
           union(){
                linear_extrude(height){
                    circle(rad);
                }
                translate([0,0,10]){
                    linear_extrude(OOBBfirstLayerLipOffset){
                        circle(rad+OOBBfirstLayerLipDepth);
                    }
                }
            }
        }
       else{
           linear_extrude(height){
               circle(rad);
           }
       }
   }
 }

module OOBBHole3DRadiusSimple(x,y,rad,height,z){    
   translate([x,y,z-height]){
   linear_extrude(height){
           circle(rad);
       }
    }
}


module OOBBCube3DComplete(x,y,wid,hei,height,z){    
   translate([x,y,z-height]){
       linear_extrude(height){
           square([wid,hei],true);
       }
   }
}

module OOBBCountersinkM33DComplete(x,y,z){    
    top = OOBBm3CounterSinkTopHole;
    bot = OOBBm3Hole;
    height = 1.75;
    OOBBCountersink3DComplete(x,y,top,bot,height,z);
}

module OOBBCountersink3DComplete(x,y,top,bot,height,z){    
   translate([x,y,z-height]){
       cylinder(h=height,r1=bot,r2=top);
   }
}


module OOBBPolygon3DComplete(sides,x,y,rad,height,z){    
   translate([x,y,z-height]){
       linear_extrude(height){
           Polygon(N=sides,R=rad,h=0);
       }
   }
}

module OOBBPolygon3DComplete90Deg(sides,x,y,rad,height,z){    
   translate([x,y,z-height]){
       linear_extrude(height){
           rotate([0,0,90]){
            Polygon(N=sides,R=rad,h=0);
           }
       }
   }
}
module OOBBPolygon3DComplete90DegSide(sides,x,y,rad,height,z){    
   translate([x,y-height,z]){
       rotate([0,90,90]){
           linear_extrude(height){
             Polygon(N=sides,R=rad,h=0);
           }
       }
   }
}



module OOBBHole(OOx,OOy){
     OOBBInsertItemCoord("OOBBHole",OOx,OOy);
}



module OOBBHoleBolt(OOx){
    translate([OOBBSpacing * OOx, 5.25]){
        translate([0, 1]){
            square([OOBBNutM6Width,OOBBNutM6Height],true);
        }
        if(m=="JA2D"){
            translate([0, -2.75]){
                square([OOBBHole*2,2],true);
            }
        }
    }
}



module OOBBJANut3D(OOx,OODepth){
    
    OOboltLength = 15;
    OOholeLength = OOboltLength-3 + 1; //bolt length, minus material thickness plus safrt
    
    //hole from bottom
    translate([OOBBSpacing * OOx, 1.5 + OOholeLength]){//bolt length minus the 3mm thickness from below 
        translate([0, 0, OODepth/2]){
            rotate([90,0,0]){
                linear_extrude(OOholeLength){ //bolt length minus the 3mm thickness from below
                    circle(OOBBHole);
                }
            }
        }       
    }
    OOBBPolygon3DComplete90DegSide(6,OOx*OS,1.5+OOBBNutM6Height+2,OOBBNutM6Width/2,OOBBNutM6Height,OODepth/2);
    

    
    
    
}

module OOBBHoleBolt3D(OOx,OODepth){
    translate([OOBBSpacing * OOx, 3.5]){
        translate([0, 0, OODepth/2]){
            rotate([90,0,0]){
                linear_extrude(2){
                    circle(OOBBHole);
                }
            }
        }       
    }
    translate([OOBBSpacing * OOx, 5.25]){
        translate([0, 1]){
            linear_extrude(OODepth){
                square([OOBBNutM6WidthShort,OOBBNutM6Height],true);
            }
        }
    }
    
    
}



module OOBBJAOutline(OOWidth,OOHeight){
    {
    //Top Left
    translate([OOBBSpacing * 1-OOBBRadiusOffset-1.5, OOBBSpacing * OOHeight+OOBBRadiusOffset]){
        circle(OOBBRadius);
    }
    //Top Right
    translate([OOBBSpacing * OOWidth+OOBBRadiusOffset + 1.5, OOBBSpacing * OOHeight+OOBBRadiusOffset]){
        circle(OOBBRadius);
    }
    
    //Bottom Square
    width4 = (OOWidth-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2 + 3;
    height4 = 14.5;//(OOHeight-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2;
    translate([(OOBBSpacing + OOWidth * OOBBSpacing)/2,8.75]){
       square([width4,height4],true);
    }

    //TallSquare
    width3 = (OOWidth-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2 - OOBBRadius*2 + 3;
    height3 = (OOHeight-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2;
    translate([(OOBBSpacing + OOWidth * OOBBSpacing)/2,(OOBBSpacing + OOHeight * OOBBSpacing)/2]){
        square([width3,height3],true);
    } 
 
    //WideSquare
    width5 = (OOWidth-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2  + 3;
    height5 = (OOHeight-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2- OOBBRadius*2;
    translate([(OOBBSpacing + OOWidth * OOBBSpacing)/2,(OOBBSpacing + OOHeight * OOBBSpacing)/2]){
        square([width5,height5],true);
    }    
}}



module OOBBCIOutlineBig(OOWidth,extra){
        circle((OOWidth * OOBBSpacing - 3)/2 + extra);   
}


module OOBBCIOutline(OOWidth){
    OOBBCIOutlineBig(OOWidth,0);
}

module OOBBCIOutlineFirstLayer(OOWidth){
    OOBBCIOutlineBig(OOWidth,-OOBBfirstLayerLipOffset);
}



module OOBBPLOutlineBig(OOWidth,OOHeight,extra){
    //Bottom Left
    translate([OOBBSpacing * 1-OOBBRadiusOffset-extra, OOBBSpacing * 1-OOBBRadiusOffset-extra]){
        circle(OOBBRadius);
    }
    //Bottom Right
    translate([OOBBSpacing * OOWidth+OOBBRadiusOffset+extra, OOBBSpacing * 1-OOBBRadiusOffset-extra]){
        circle(OOBBRadius);
    }    
    //Top Left
    translate([OOBBSpacing * 1-OOBBRadiusOffset-extra, OOBBSpacing * OOHeight+OOBBRadiusOffset+extra]){
        circle(OOBBRadius);
    }
    //Top Right
    translate([OOBBSpacing * OOWidth+OOBBRadiusOffset+extra, OOBBSpacing * OOHeight+OOBBRadiusOffset+extra]){
        circle(OOBBRadius);
    }
    
    //WideSquare
    width = (OOWidth-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2 + extra*2;
    height = (OOHeight-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2 - OOBBRadius*2+extra*2;
    translate([(OOBBSpacing + OOWidth * OOBBSpacing)/2,(OOBBSpacing + OOHeight * OOBBSpacing)/2]){
        square([width,height],true);
    }

    //TallSquare
    width2 = (OOWidth-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2 - OOBBRadius*2+extra*2;
    height2 = (OOHeight-1) * OOBBSpacing + OOBBRadius * 2 + OOBBRadiusOffset * 2+extra*2;
    translate([(OOBBSpacing + OOWidth * OOBBSpacing)/2,(OOBBSpacing + OOHeight * OOBBSpacing)/2]){
        square([width2,height2],true);
    }    
    
    
    
}

module OOBBPLOutline(OOWidth,OOHeight){
    OOBBPLOutlineBig(OOWidth,OOHeight,0);    
}

module OOBBPLOutlineFirstLayer(OOWidth,OOHeight){
    OOBBPLOutlineBig(OOWidth,OOHeight,-OOBBfirstLayerLipOffset);
}


module OOBBPLOutlineBigFirstLayer(OOWidth,OOHeight,extra){
    OOBBPLOutlineBig(OOWidth,OOHeight,-OOBBfirstLayerLipOffset + extra);
}

module OOBBPLOutlineComplete(wid,hei){
    translate([-wid/2,-hei/2,0]){
       //Bottom Left
        translate([OOBBRadius, OOBBRadius, 0]){
            circle(OOBBRadius);
        }
        
        //Bottom Right
        translate([OOBBRadius, hei-OOBBRadius]){
            circle(OOBBRadius);
        }    
        //Top Left
        translate([wid-OOBBRadius, hei-OOBBRadius]){
            circle(OOBBRadius);
        }
        //Top Right
        translate([wid-OOBBRadius, OOBBRadius,0]){
            circle(OOBBRadius);
        }
        
        //WideSquare
        w = wid;
        h =hei-OOBBRadius*2;
        translate([wid/2,hei/2]){
            square([w,h],true);
        }

        //TallSquare
        w2 = wid-OOBBRadius*2;
        h2 = hei;
        translate([wid/2,hei/2]){
            square([w2,h2],true);
        }    
    }
    
    
}

module BP_6806_04_04(){
     OOWidth = 4;
    OOHeight = 4;    
    OOCentre = 2.5;
    bearingHeight = 7;
    ooThickness=12;
    //OUTSIDE
    difference(){
        OOBBPLOutline3D(OOWidth,OOHeight,12);
        //OOBB Holes
        OOBBHole3D(1,1);
        //OOBBSlotTall3D(1,1);
        //OOBBSlotWide3D(1,1);
        OOBBHole3D(1,OOHeight);
        
        OOBBHole3D(OOHeight,1);
        //OOBBSlotTall3D(3,1);
        
        OOBBHole3D(OOWidth,OOHeight);
        
        
        
        OOBBInsertItemCoord("Bearing6806Hold",OOCentre,OOCentre,ooZ=ooThickness/2+(bearingHeight/2));
        
        
    }
    //INSIDE
    //inside
    translate([OOCentre*OOBBSpacing,OOCentre*OOBBSpacing,0]){
       difference(){
           union(){
               linear_extrude(ooThickness){
                   circle(OOBBBearing6806Inside);   
               } 
               translate([0,0,0]){
                   linear_extrude((ooThickness-bearingHeight)/2){
                       circle(OOBBBearing6806LittleInside);   
                   } 
               }
               translate([0,0,ooThickness-((ooThickness-bearingHeight)/2)]){
                   linear_extrude((ooThickness-bearingHeight)/2){
                       circle(OOBBBearing6806LittleInside);   
                   } 
               }
           }
        OOBBInsertItemCoord("OOBBHole",0.5,0.5);
        OOBBInsertItemCoord("OOBBHole",0.5,-0.5);
        OOBBInsertItemCoord("OOBBHole",-0.5,0.5);
        OOBBInsertItemCoord("OOBBHole",-0.5,-0.5);           
           
           
       }
    }
    

}

module BP_6810_05_05(){
     OOWidth = 5;
    OOHeight = 5;    
    bearingHeight = 7;
    ooThickness=12;
    //OUTSIDE
    difference(){
        OOBBPLOutline3D(OOWidth,OOHeight,12);
        //OOBB Holes
        OOBBHole3D(1,1);
        //OOBBSlotTall3D(1,1);
        //OOBBSlotWide3D(1,1);
        OOBBHole3D(1,5);
        
        OOBBHole3D(5,1);
        //OOBBSlotTall3D(3,1);
        
        OOBBHole3D(5,5);
        
        
        
        OOBBInsertItemCoord("Bearing6810Hold",3,3,ooZ=ooThickness/2+(bearingHeight/2));
        
        
    }
    //INSIDE
    //inside
    translate([3*OOBBSpacing,3*OOBBSpacing,0]){
       difference(){
           union(){
               linear_extrude(ooThickness){
                   circle(OOBBBearing6810Inside);   
               } 
               translate([0,0,0]){
                   linear_extrude((ooThickness-bearingHeight)/2){
                       circle(OOBBBearing6810LittleInside);   
                   } 
               }
               translate([0,0,ooThickness-((ooThickness-bearingHeight)/2)]){
                   linear_extrude((ooThickness-bearingHeight)/2){
                       circle(OOBBBearing6810LittleInside);   
                   } 
               }
           }
        OOBBInsertItemCoord("OOBBHole",0,0);
        OOBBInsertItemCoord("OOBBHole",0,-1);
        OOBBInsertItemCoord("OOBBHole",0,1);
        OOBBInsertItemCoord("OOBBHole",1,0);
        OOBBInsertItemCoord("OOBBHole",-1,0);
        rotate([0,0,45]){
            OOBBInsertItemCoord("OOBBHole",0,0);
            OOBBInsertItemCoord("OOBBHole",0,-1);
            OOBBInsertItemCoord("OOBBHole",0,1);
            OOBBInsertItemCoord("OOBBHole",1,0);
            OOBBInsertItemCoord("OOBBHole",-1,0);
        }
       }
    }
    

}//######  OOBB OpenSCAD Generation  ######
//########################################

    //OPENSCAD Variables

    //CORE
    OOBBSpacing = 15;
    OOBBRadius  = 10/2;
    OOBBMaterialThickness = 3;
    OOBBRadiusOffset = 1;

    
    OOBBfirstLayerLipOffset = 0.35;
    OOBBfirstLayerLipDepth = 0.2;

    // HOLES
    OOBBHoleTrue = 6/2;
    OOBBHole3D  = 6.5/2;
    
    OOBBHoleLaser = 6/2;
    
    OOBBHole = s=="3DPR" ? OOBBHole3D : OOBBHoleTrue;
    echo("                  OOBBHole =",OOBBHole);


    // Bearings
    OOBBBearing606BigTrue = 17/2;
    OOBBBearing606Big3D  = 17.5/2;
    
    OOBBBearing606Big = s=="3DPR" ? OOBBBearing606Big3D : OOBBBearing606BigTrue;

    OOBBBearing606LittleTrue = 14/2;
    OOBBBearing606Little3D  = 14.5/2;
    
    OOBBBearing606Little = s=="3DPR" ? OOBBBearing606Little3D : OOBBBearing606LittleTrue;

    //6804
        Bearing6804Inside = 19.8/2;
    
    //6704 Bearing
    OOBBBearing6704InsideTrue = 20/2;
    OOBBBearing6704Inside3D  = 19.8/2;
    OOBBBearing6704Inside = s=="3DPR" ? OOBBBearing6704Inside3D : OOBBBearing6704InsideTrue;

    OOBBBearing6704OutsideTrue = 27/2;
    OOBBBearing6704Outside3D  = (27-0.2)/2;
    OOBBBearing6704Outside = s=="3DPR" ? OOBBBearing6704Outside3D : OOBBBearing6704OutsideTrue;

    OOBBBearing6704OutsideHoldTrue = OOBBBearing6704OutsideTrue;
    OOBBBearing6704OutsideHold3D  = (OOBBBearing6704OutsideHoldTrue+(0.1/2));
    OOBBBearing6704OutsideHold = s=="3DPR" ? OOBBBearing6704OutsideHold3D : OOBBBearing6704OutsideHoldTrue;

    OOBBBearing6704Little = (27-3)/2;
    OOBBBearing6704LittleInside = 21.5/2;
    
    OOBBBearing6704Thickness = 4;
    
    //6803 Bearing
    OOBBBearing6803InsideTrue = 17/2;
    OOBBBearing6803Inside3D  = 16.8/2;
    OOBBBearing6803Inside = s=="3DPR" ? OOBBBearing6803Inside3D : OOBBBearing6803InsideTrue;

    OOBBBearing6803OutsideTrue = 26/2;
    OOBBBearing6803Outside3D  = (26-0.2)/2;
    OOBBBearing6803Outside = s=="3DPR" ? OOBBBearing6803Outside3D : OOBBBearing6803OutsideTrue;

    OOBBBearing6803OutsideHoldTrue = OOBBBearing6803OutsideTrue;
    OOBBBearing6803OutsideHold3D  = (OOBBBearing6803OutsideHoldTrue+(0.25/2)); //0.2 was a bit too tight
    OOBBBearing6803OutsideHold = s=="3DPR" ? OOBBBearing6803OutsideHold3D : OOBBBearing6803OutsideHoldTrue;

    OOBBBearing6803Little = 21/2;
    OOBBBearing6803LittleInside = (17+1.5)/2;

    OOBBInsideTrueAmount = 0.15;    
    OOBBOutsideHoldAmount = 0.25;

    //6806 Bearing //currently working on these values
    OOBBBearing6806InsideTrue = 30/2;
    OOBBBearing6806Inside3D  = (OOBBBearing6806InsideTrue-(0.125/2)); //0.15 a bit too much
    OOBBBearing6806Inside = s=="3DPR" ? OOBBBearing6806Inside3D : OOBBBearing6806InsideTrue;

    OOBBBearing6806OutsideTrue = 42/2;
    OOBBBearing6806Outside3D  = (OOBBBearing6806OutsideTrue-(0.2/2));
    OOBBBearing6806Outside = s=="3DPR" ? OOBBBearing6806Outside3D : OOBBBearing6806OutsideTrue;

    OOBBBearing6806OutsideHoldTrue = OOBBBearing6806OutsideTrue;
    OOBBBearing6806OutsideHold3D  = (OOBBBearing6806OutsideHoldTrue+(0.25/2));
    OOBBBearing6806OutsideHold = s=="3DPR" ? OOBBBearing6806OutsideHold3D : OOBBBearing6806OutsideHoldTrue;
    
    OOBBBearing6806Little = OOBBBearing6806OutsideTrue-(3/2);
    OOBBBearing6806LittleInside = OOBBBearing6806InsideTrue+(3/2);

    //6808 Bearing
    OOBBBearing6808InsideTrue = 40/2;
    OOBBBearing6808Inside3D  = (OOBBBearing6808InsideTrue-(0.15/2));
    OOBBBearing6808Inside = s=="3DPR" ? OOBBBearing6808Inside3D : OOBBBearing6808InsideTrue;

    OOBBBearing6808OutsideTrue = 52/2;
    OOBBBearing6808Outside3D  = (OOBBBearing6808OutsideTrue-(0.2/2));
    OOBBBearing6808Outside = s=="3DPR" ? OOBBBearing6808Outside3D : OOBBBearing6808OutsideTrue;

    OOBBBearing6808OutsideHoldTrue = OOBBBearing6808OutsideTrue;
    OOBBBearing6808OutsideHold3D  = (OOBBBearing6808OutsideHoldTrue+(0.25/2));
    OOBBBearing6808OutsideHold = s=="3DPR" ? OOBBBearing6808OutsideHold3D : OOBBBearing6808OutsideHoldTrue;
    
    OOBBBearing6808Little = OOBBBearing6808OutsideTrue-(3/2);
    OOBBBearing6808LittleInside = OOBBBearing6808InsideTrue+(3/2);

    
    //6810 Bearing
    OOBBBearing6810InsideTrue = 50/2;
    OOBBBearing6810Inside3D  = (OOBBBearing6810InsideTrue-(0.15/2));
    OOBBBearing6810Inside = s=="3DPR" ? OOBBBearing6810Inside3D : OOBBBearing6810InsideTrue;

    OOBBBearing6810OutsideTrue = 65/2;
    OOBBBearing6810Outside3D  = (OOBBBearing6810OutsideTrue-(0.2/2));
    OOBBBearing6810Outside = s=="3DPR" ? OOBBBearing6810Outside3D : OOBBBearing6810OutsideTrue;

    OOBBBearing6810OutsideHoldTrue = OOBBBearing6810OutsideTrue;
    OOBBBearing6810OutsideHold3D  = (OOBBBearing6810OutsideHoldTrue+(0.6/2)); //0.45 almost large enough going to 0.6 for safetuy margin)
    OOBBBearing6810OutsideHold = s=="3DPR" ? OOBBBearing6810OutsideHold3D : OOBBBearing6810OutsideHoldTrue;

    OOBBBearing6810Little = OOBBBearing6810OutsideTrue-(3/2);
    OOBBBearing6810LittleInside = OOBBBearing6810InsideTrue+(3/2);

    // NUTS
    OOBBNutM3WidthTrue = 6.351;    //5.5mm short side
    //OOBBNutM3Width3D = 6.928; //needs to be the long side old value 2020/07 
    OOBBNutM3Width3D = 7.028; //needs to be the long side 
    
    // //6mm short side    
    
    OOBBNutM3Width = s=="3DPR" ? OOBBNutM3Width3D : OOBBNutM3WidthTrue;
    
    OOBBNutM3WidthShortSideTrue = 5.5;    //5.5mm short side
    OOBBNutM3WidthShortSide3D = 6; //needs to be the long side // //6mm short side    
    
    OOBBNutM3WidthShortSide = s=="3DPR" ? OOBBNutM3WidthShortSide3D : OOBBNutM3WidthShortSideTrue;
    
    
    
    OOBBNutM3HeightTrue = 2.5;    //actually 4.85 extra for clearance
    OOBBNutM3Height3D = 2.5;    
    
    OOBBNutM3Height = s=="3DPR" ? OOBBNutM3Height3D : OOBBNutM3HeightTrue;
    

    OOBBNutTripodWidthTrue = 12.8;    //short side 10
    OOBBNutTripodWidth3D = 14; //needs to be the long side (short side is   
    OOBBNutTripodWidth = s=="3DPR" ? OOBBNutTripodWidth3D : OOBBNutTripodWidthTrue;
    
    OOBBNutTripodHeightTrue = 5.2;    //actually 4.85 extra for clearance
    OOBBNutTripodHeight3D = 5.2;    
    
    OOBBNutTripodHeight = s=="3DPR" ? OOBBNutTripodHeight3D : OOBBNutTripodHeightTrue;

    
    OOBBNutM6WidthTrue = 11.547;    //short side 10
    OOBBNutM6Width3D = 12.7; //needs to be the long side (short side is   
    
    

    OOBBNutM6Width = s=="3DPR" ? OOBBNutM6Width3D : OOBBNutM6WidthTrue;
    
    
    
    
    
    OOBBNutM6WidthShortTrue = 10;    
    OOBBNutM6WidthShort3D = 11; //needs to be the long side    
    
    OOBBNutM6WidthShort = s=="3DPR" ? OOBBNutM6WidthShort3D : OOBBNutM6WidthShortTrue;
    
    
    OOBBNutM6HeightTrue = 5;    //actually 4.85 extra for clearance
    OOBBNutM6Height3D = 5;    
    
    OOBBNutM6Height = s=="3DPR" ? OOBBNutM6Height3D : OOBBNutM6HeightTrue;
    
    OOBBm6HoleTrue = 6/2;
    OOBBm6Hole3D = 6.5/2;
    OOBBm6Hole = s=="3DPR" ? OOBBm6Hole3D : OOBBm6HoleTrue;
        
    OOBBm3HoleTrue = 3/2;
    OOBBm3Hole3D = 3.4/2;
    OOBBm3Hole = s=="3DPR" ? OOBBm3Hole3D : OOBBm3HoleTrue;
    
    
    OOBBm27HoleTrue = 2.7/2;
    OOBBm27Hole3D = 3/2;
    OOBBm27Hole = s=="3DPR" ? OOBBm27Hole3D : OOBBm27HoleTrue;
    
    
    OOBBm27RivetClearanceTrue = 5/2;
    OOBBm27RivetClearance3D = 5.4/2;
    OOBBm27RivetClearance = s=="3DPR" ? OOBBm27RivetClearance3D : OOBBm27RivetClearanceTrue;
    
    
    
    
    OOBBm2HoleTrue = 2/2;
    OOBBm2Hole3D = 2.3/2;
    OOBBm2Hole = s=="3DPR" ? OOBBm2Hole3D : OOBBm2HoleTrue;
    
    
    OOBBm3CounterSinkTopHoleTrue = 5.5/2;
    OOBBm3CounterSinkTopHole3D = OOBBm3CounterSinkTopHoleTrue + 0.6;
    OOBBm3CounterSinkTopHole = s=="3DPR" ? OOBBm3CounterSinkTopHole3D : OOBBm3CounterSinkTopHoleTrue;    
    
    OOBBm3CounterSinkTopDepthTrue = 1.7;
    OOBBm3CounterSinkTopDepth3D = OOBBm3CounterSinkTopDepthTrue + 0.2;
    OOBBm3CounterSinkTopDepth = s=="3DPR" ? OOBBm3CounterSinkTopDepth3D : OOBBm3CounterSinkTopDepthTrue;    
    
    
    OOBBm3SocketHeadHoleTrue = 5.5/2;
    OOBBm3SocketHeadHole3D = OOBBm3SocketHeadHoleTrue + 0.4;
    OOBBm3SocketHeadHole = s=="3DPR" ? OOBBm3SocketHeadHole3D : OOBBm3SocketHeadHoleTrue;   
    
    OOBBm3SocketHeadDepthTrue = 3;
    OOBBm3SocketHeadDepth3D = OOBBm3SocketHeadDepthTrue + 0.8;
    OOBBm3SocketHeadDepth = s=="3DPR" ? OOBBm3SocketHeadDepth3D : OOBBm3SocketHeadDepthTrue;    
    
    // TABS
    OOBBTabWidthTrue = 3;
    OOBBTabWidth3D = 2.7;
    OOBBTabWidthLaser = 3;
  
    OOBBTabWidth = s=="3DPR" ? OOBBTabWidth3D : OOBBTabWidthTrue;
    
    OOBBTabWidthHoleTrue = 3;
    OOBBTabWidthHole3D = 3.4;
    OOBBTabWidthHoleLaser = 3;
   
    OOBBTabWidthHole = s=="3DPR" ? OOBBTabWidthHole3D : OOBBTabWidthHoleTrue;
    
    OOBBTabHeightTrue = OOBBTabWidthTrue;
    OOBBTabHeight3D = OOBBTabWidth3D;
    OOBBTabHeightLaser = OOBBTabWidthLaser;
    
    OOBBTabHeight = s=="3DPR" ? OOBBTabHeight3D : OOBBTabHeightTrue;
    
    OOBBTabHeightHoleTrue = OOBBTabWidthHoleTrue;
    OOBBTabHeightHole3D = OOBBTabWidthHole3D;
    OOBBTabHeightHoleLaser = OOBBTabWidthHoleLaser;
    
    OOBBTabHeightHole = s=="3DPR" ? OOBBTabHeightHole3D : OOBBTabHeightHoleTrue;






//thicknesses
baseCapHeight = 5;        
spacerHeight = 12;
extraCapHeight = baseCapHeight+7;  //this is the amount to stretch the cap
bearingHeight = 4;  //default to 6704
totalHeight = spacerHeight + bearingHeight;
holderBaseHeight = 2; //used to be 12 6 too small may need to be 9

thicknessHolderA = bearingHeight + 2 + baseCapHeight;
thicknessHolderB = 5+5;
thicknessBracket = 12.5;



heightHolderA = thicknessHolderA + thicknessHolderB + thicknessBracket;
heightHolderB = thicknessHolderB + thicknessBracket;
heightBracket = thicknessBracket;


//todo
//add a second M3 hole to hold servo on each side
//remove slot for single hole
//make screws come up from bottom
//add block to lock m3 nuts on servo
module OOBB_HL_SE_05_03(){
   mode = "3DPR";
    //mode = "EXPLODED";
   //mode = "NONE";
    
    if(mode == "3DPR"){

        //######  HOLDER PART
        if( extra == "NONE" || extra=="HOLDER"  || extra=="HOLDERA" || extra=="NOHORN"){
        translate([OS*2,OS*2,thicknessHolderA/2]){
            rotate([0,180,0]){
                translate([0,0,-heightHolderA+thicknessHolderA-thicknessHolderA/2]){
                    OOBB_HL_SE_05_03_HOLDER_A();    
                }
            }
        }
    }
        //######  HOLDER PART
        if( extra == "NONE" || extra=="HOLDER"  || extra=="HOLDERB" || extra=="NOHORN"){
            translate([0,0,0]){
                translate([OS*5,OS*2,-heightHolderB+thicknessHolderB]){
                            OOBB_HL_SE_05_03_HOLDER_B();    
                }
            }
        }
        
        //######  SERVO BRACKET
        if( extra == "NONE" || extra=="BRACKET" || extra=="NOHORN"){
            translate([2*OS,5*OS,0]){
                OOBB_HL_SE_05_03_BRACKET();
            }
        }
        
        //###### Servo Horn
        if( extra == "NONE" || extra=="HORN"){    
            translate([7.5*OS,4*OS,0]){    
                OOBB_HL_SE_05_03_SERVOHORN();
            }
        }
        //###### NutBracket
        if( extra == "NONE" || extra=="NUTBRACKET"){    
            translate([7*OS,6*OS,0]){    
                //OOBB_HL_SE_05_03_NUTBRACKET();
                translate([0,10,0]){    
                    //OOBB_HL_SE_05_03_NUTBRACKET();
                }
            }
        }
    }
    else if(mode=="EXPLODED"){
        translate([0,0,40]){
        OOBB_HL_SE_05_03_HOLDER_A();
        }
        translate([0,0,20]){
        OOBB_HL_SE_05_03_HOLDER_B();    
        }
        translate([0,0,0]){
        OOBB_HL_SE_05_03_BRACKET();
        }
        translate([0,0,60]){
        //OOBB_HL_SE_05_03_SERVOHORN();
        }
    }
    else if(mode=="NONE"){
    
                //OOBB_HL_SE_05_03_HOLDER_A();
                //OOBB_HL_SE_05_03_HOLDER_B();    
                //OOBB_HL_SE_05_03_BRACKET();
                //OOBB_HL_SE_05_03_SERVOHORN();
                OOBB_HL_SE_05_03_NUTBRACKET();
    }
}





///########
///########
///########  HOLDER
///########
        
module OOBB_HL_SE_05_03_HOLDER_A(){
    difference(){
            OOBB_HL_SE_05_03_HOLDER_A_BASE();
            OOBB_HL_SE_05_03_HOLDER_MAINHOLES();
    }
}


module OOBB_HL_SE_05_03_HOLDER_B(){ 
    difference(){
        OOBB_HL_SE_05_03_HOLDER_B_BASE();
        OOBB_HL_SE_05_03_HOLDER_MAINHOLES();
    }
}
       
module OOBB_HL_SE_05_03_BRACKET(){
    difference(){
        OOBB_HL_SE_05_03_BRACKET_BASE();
        OOBB_HL_SE_05_03_HOLDER_MAINHOLES();
    }
}


////######  BASE ROUTNES



module OOBB_HL_SE_05_03_HOLDER_A_BASE(){
    translate([0,0,heightHolderA-thicknessHolderA]){
        difference(){
            union(){
                translate([OS * -2,OS * -2,0]){
                    OOBBPLOutline3D(3,3,thicknessHolderA);
                    //OOBBPLOutline3D(5,3,thicknessHolderA-4);
                }
            }
            TOP = 1;
            RIGHT = 1;
            BOTTOM = -1;
            LEFT = -1;
            //original clearance height 4
            //ch = 4;
            ch = 4;
            OOBBinsert("M6BoltClearanceCorner",x=LEFT*OS,y=TOP*OS,z=thicknessHolderA,height=ch,rot=270);
            //OOBBinsert("M6BoltClearanceCorner",x=RIGHT*OS,y=TOP*OS,z=thicknessHolderA,height=ch,rot=180);
            OOBBinsert("M6BoltClearanceCorner",x=LEFT*OS,y=BOTTOM*OS,z=thicknessHolderA,height=ch,rot=0);
            //OOBBinsert("M6BoltClearanceCorner",x=RIGHT*OS,y=BOTTOM*OS,z=thicknessHolderA,height=ch,rot=90);
              OOBBinsert("Bearing6704ClearanceTube",0,0,z=thicknessHolderA-2-OOBBBearing6704Thickness,height=thicknessHolderA-OOBBBearing6704Thickness-2);
        }    
    }
}

module OOBB_HL_SE_05_03_HOLDER_B_BASE(){
    translate([0,0,heightHolderB-thicknessHolderB]){
        difference(){
            union(){
                translate([OS * -2,OS * -2,0]){
                    //OOBBPLOutline3D(5,3,thicknessHolderB);
                    OOBBPLOutline3D(3,3,thicknessHolderB);
                }
                OOBBinsert("Bearing6704ClearanceTube",0,0,z=thicknessHolderB+thicknessHolderA-OOBBBearing6704Thickness-2,height=thicknessHolderA-OOBBBearing6704Thickness-2);
                
            }
        }
    }
}


module OOBB_HL_SE_05_03_BRACKET_BASE(){
    translate([0,0,0]){
        translate([OS*-2,OS*-2,0]){
            OOBBPLOutline3D(5,3,thicknessBracket);
        }
    }
}

module OOBB_HL_SE_05_03_NUTBRACKET(){
    translate([0,0,10]){
        difference(){
            OOBBCube3DComplete(x=0,y=0,wid=20,hei=6,height=8,z=0);
            OOBBCube3DComplete(x=0,y=0.5,wid=3,hei=5,height=3,z=0);
            OOBBinsert(x=5,y=0,z=0,"M3NutCaptiveSingle");
            OOBBinsert(x=5,y=0,z=0,"M3Hole");
            OOBBinsert(x=-5,y=0,z=0,"M3NutCaptiveSingle");
            OOBBinsert(x=-5,y=0,z=0,"M3Hole");
        }
    }
}


////######  HOLE ROUTINES




module OOBB_HL_SE_05_03_HOLDER_MAINHOLES(){
//holes
    
    //main holes
        OOBBinsert("OOBBHoleSlot",-1*OS,1*OS,rot=270);
        //OOBBinsert("OOBBHoleSlot",1*OS,1*OS,rot=180);
        OOBBinsert("OOBBHoleSlot",-1*OS,-1*OS,rot=0);
        //OOBBinsert("OOBBHoleSlot",1*OS,-1*OS,rot=90);
        OOBBinsert("Bearing6704Hold",0,0,z=heightHolderA-2);
        //bottomHoles
        OOBBinsert("OOBBHole",2*OS,-1*OS);
        OOBBinsert("OOBBHole",3*OS,-1*OS);
        //topHoles
        OOBBinsert("OOBBHole",2*OS,1*OS);
        OOBBinsert("OOBBHole",3*OS,1*OS);
        //middleHole
        OOBBinsert("OOBBHole",3*OS,0*OS);

    
    //cap joining screws
        capJoiningScrewX1 = -1*OOBBSpacing-2;
        capJoiningScrewY1 = 0;
        capJoiningScrewX2 = 1*OOBBSpacing+2;

        capJoiningScrewZ1 = heightHolderA-OOBBm3SocketHeadDepth;
        capScrewLength=12;
        OOBBinsert("M3SocketHeadFull",capJoiningScrewX1,capJoiningScrewY1,z=capJoiningScrewZ1,length=capScrewLength);
        OOBBinsert("M3NutCaptiveSingle",capJoiningScrewX1,z=capJoiningScrewZ1-capScrewLength+2.5,length=capScrewLength);
        OOBBinsert("M3NutCaptiveSingle",capJoiningScrewX1,z=capJoiningScrewZ1-capScrewLength+3.5,length=capScrewLength);
        
        OOBBinsert("M3SocketHeadFull",capJoiningScrewX2,capJoiningScrewY1,z=capJoiningScrewZ1,length=capScrewLength);
        OOBBinsert("M3NutCaptiveSingle",capJoiningScrewX2,z=capJoiningScrewZ1-capScrewLength+2.5,length=capScrewLength);
        OOBBinsert("M3NutCaptiveSingle",capJoiningScrewX2,z=capJoiningScrewZ1-capScrewLength+3.5,length=capScrewLength);

    //long joining screws
        longJoiningScrewX1 = 0;
        longJoiningScrewY1 = -1*OS-2;
        longJoiningScrewX2 = 0;
        longJoiningScrewY2 = 1*OS+2;
        longJoiningScrewZ1 = heightHolderA-OOBBm3SocketHeadDepth;
        longScrewLength=30;
        OOBBinsert("M3SocketHeadFull",longJoiningScrewX1,longJoiningScrewY1,z=longJoiningScrewZ1,length=longScrewLength);
        OOBBinsert("M3NutCaptiveSingle",longJoiningScrewX1,longJoiningScrewY1,z=longJoiningScrewZ1-longScrewLength+2.5);
        OOBBinsert("M3NutCaptiveSingle",longJoiningScrewX1,longJoiningScrewY1,z=longJoiningScrewZ1-longScrewLength+3.5);
        
        OOBBinsert("M3SocketHeadFull",longJoiningScrewX2,longJoiningScrewY2,z=longJoiningScrewZ1,length=longScrewLength);
        OOBBinsert("M3NutCaptiveSingle",longJoiningScrewX2,longJoiningScrewY2,z=longJoiningScrewZ1-longScrewLength+2.5);
        OOBBinsert("M3NutCaptiveSingle",longJoiningScrewX2,longJoiningScrewY2,z=longJoiningScrewZ1-longScrewLength+3.5);
        
        



/*
    
    OOBBInsertItemMM("M3Hole",3*OOBBSpacing+2,2*OOBBSpacing);      
    OOBBInsertItemMM("M3Hole",1*OOBBSpacing-2,2*OOBBSpacing);      
 //Servo Low
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,3*OOBBSpacing+2);      
    //Servo High
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,1*OOBBSpacing-2);
    */

    //servo mount
        OOBBinsert("ServoFullMountTop",0,0,z=6,height=7+5,rot=180);
        //OOBBInsertItemMM("M3Slot",0*OOBBSpacing,1*OOBBSpacing+2);
        //OOBBInsertItemMM("M3Slot",0*OOBBSpacing,-1*OOBBSpacing-2);
 /*           
               
            //Servo Low
            
        OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,3*OOBBSpacing+2,ooZ=OOBBNutM3Height,height=20);      
        //Servo High
        OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,1*OOBBSpacing-2,ooZ=OOBBNutM3Height,height=20);      
       
        
        extraNutHeight =     holderBaseHeight+extraCapHeight-baseCapHeight-3;
        OOBBInsertItemMM("M3NutCaptive",3*OOBBSpacing+2,2*OOBBSpacing,ooZ=extraNutHeight,height=20);      
        
        OOBBInsertItemMM("M3NutCaptive",1*OOBBSpacing-2,2*OOBBSpacing,ooZ=extraNutHeight,height=20);      
        
        
        
        OOBBInsertItemCoord("ServoHole",2,2,height=holderBaseHeight+extraCapHeight-baseCapHeight-5);
        //OOBB_HL_SM_03_03_BASE_HOLES();
        
        nutHeight = 4;
        //OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=0);
        //OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=180);
   */                
/*
    nutHeight = OOBBNutM3Height;
    nutGap = nutHeight;
    //Servo Low
   
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight-2);
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight); //to allow for using 30mm bolts      
    //Servo High
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight);
    //to allow for using 30mm bolts
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight-2); 
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight); //Retaining Screws
    OOBBInsertItemMM("M3SocketHead",3*OOBBSpacing+2,2*OOBBSpacing,height=capHeight);      
    OOBBInsertItemMM("M3SocketHead",1*OOBBSpacing-2,2*OOBBSpacing,height=capHeight);      
    
    

*/
            
}

///########
///########
///########  SERVOHORN
///########

	
botTubeHeightFull=7;
topTubeHeightFull = 4;
	
module OOBB_HL_SE_05_03_SERVOHORN_WHEEL(){

	bearingTubeHeight = 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = OOBBBearing6704Inside; //default to 6704
	bearingLittle = OOBBBearing6704Little;
    totalHeight = botTubeHeightFull+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19
	
    topHeight = topTubeHeightFull + 9; //9 is wheel width
    bottomHeight = botTubeHeightFull + bearingTubeHeight;
        
    
    
        //TOP PIECE
    //translate([0,0,0]){
    translate([0,0,topHeight/2]){  //move to zero height
        rotate([0,180,0]){ //rotate 180 to print upside down
            translate([0,0,-bottomHeight - topHeight/2]){ //shift so centred for flip
                difference(){
                    union(){
                        //bottomTube
                        
                        
                        //topTube
                        translate([0,0,botTubeHeightFull+bearingTubeHeight+topTubeHeightFull/2  ]){
                            //cylinder(topTubeHeight,bearingLittle-0.5,bearingLittle-0.5,true);
                            cylinder(topTubeHeightFull,bearingInside+1,bearingInside+1,true);
                        }
                        //wheel
                        translate([0,0,totalHeight]){
                            rotate([0,180,0]){
                                OOBB_WH_SOLID(3);
                            }
                        }
                               //bearing tube
                        translate([0,0,botTubeHeightFull+bearingTubeHeight/2  ]){
                            cylinder(bearingTubeHeight,bearingInside,bearingInside,true);
                            } 
                    }
                    OOBB_HL_SE_05_03_SERVOHORN_HOLES();
                }
            }
        }

    }
    
        // BOTTOM PIECE
    //translate([0,0,0]){
    translate([0,-OOBBSpacing*2-3,7]){
        rotate([0,180,0]){//rotate 180 to print upside down
            difference(){
                union(){
                    
                    translate([0,0,0]){
                        //OOBBcylinder(botTubeHeightFull,bearingLittle-0.5,bearingLittle-0.5);
                        OOBBcylinder(botTubeHeightFull,bearingInside+1,bearingInside+1);
                    }
                    //bearingTube    
                    
                    
                    
                    
                    
                }
                OOBB_HL_SE_05_03_SERVOHORN_HOLES();
            }
        }
    }    
	
}


module OOBB_HL_SE_05_03_SERVOHORN(){

	bearingTubeHeight = 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = OOBBBearing6704Inside; //default to 6704
	bearingLittle = OOBBBearing6704Little;
    totalHeight = botTubeHeightFull+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19
	
    topHeight = topTubeHeightFull + 9; //9 is wheel width
    bottomHeight = botTubeHeightFull + bearingTubeHeight;
        
    
    
        //TOP PIECE
    //translate([0,0,0]){
    translate([0,0,topHeight/2]){  //move to zero height
        rotate([0,180,0]){ //rotate 180 to print upside down
            translate([0,0,-bottomHeight - topHeight/2]){ //shift so centred for flip
                difference(){
                    union(){
                        //bottomTube
                        
                        
                        //topTube
                        translate([0,0,botTubeHeightFull+bearingTubeHeight+topTubeHeightFull/2  ]){
                            //cylinder(topTubeHeight,bearingLittle-0.5,bearingLittle-0.5,true);
                            cylinder(topTubeHeightFull,bearingInside+1,bearingInside+1,true);
                        }
                        //wheel
                        translate([0,0,totalHeight]){
                            rotate([0,180,0]){
                                translate([-1*OS,-2*OS,0]){
                                    union(){
                                        translate([4,0,0]){
                                            OOBBPLOutline3D(1,3,9);
                                        }
                                        translate([-4,0,0]){
                                            OOBBPLOutline3D(1,3,9);
                                        }
                                        translate([2,0,0]){
                                            OOBBPLOutline3D(1,3,9);
                                        }
                                        translate([-2,0,0]){
                                            OOBBPLOutline3D(1,3,9);
                                        }
                                        translate([6,0,0]){
                                            OOBBPLOutline3D(1,3,9);
                                        }
                                        translate([-6,0,0]){
                                            OOBBPLOutline3D(1,3,9);
                                        }
                                        OOBBPLOutline3D(1,3,9);
                                    }
                                }
                                //OOBB_WH_SOLID(3);
                            }
                        }
                               //bearing tube
                        translate([0,0,botTubeHeightFull+bearingTubeHeight/2  ]){
                            cylinder(bearingTubeHeight,bearingInside,bearingInside,true);
                            } 
                    }
                    OOBB_HL_SE_05_03_SERVOHORN_HOLES();
                    OOBBinsert("OOBBHole",0,-1*OS,0);
                    OOBBinsert("OOBBHole",0,1*OS,0);
                    OOBBinsert("M6BoltClearanceSide",0,1*OS,19,height=4,rot=180);
                    OOBBinsert("M6BoltClearanceSide",0,-1*OS,19,height=4,rot=0);
                    
                }
            }
        }

    }
    
        // BOTTOM PIECE
    //translate([0,0,0]){
    translate([0,-OOBBSpacing*2-3,7]){
        rotate([0,180,0]){//rotate 180 to print upside down
            difference(){
                union(){
                    
                    translate([0,0,0]){
                        //OOBBcylinder(botTubeHeightFull,bearingLittle-0.5,bearingLittle-0.5);
                        OOBBcylinder(botTubeHeightFull,bearingInside+1,bearingInside+1);
                    }
                    //bearingTube    
                    
                    
                    
                    
                    
                }
                OOBB_HL_SE_05_03_SERVOHORN_HOLES();
            }
        }
    }    
	
}

module OOBB_HL_SE_05_03_SERVOHORN_HOLES(){
    OOBB_screwClamp1Y = 0; 
    OOBB_screwClamp2Y = 0;
    OOBB_screwClamp1X = 8.125;
    OOBB_screwClamp2X = -8.125;
	
    
    
	bearingTubeHeight = 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = OOBBBearing6704Inside; //default to 6704
	bearingLittle = OOBBBearing6704Little;
    totalHeight = botTubeHeightFull+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19

		OOBBinsert("ServoMicroHornHole",0,0,height=4,rot=90);
		OOBBInsertItemCoord("OOBBHole",0,0,height=4);
		
		
	//for tg90
	//OOBBInsertItemCoord("ServoMicroHornCatchSingleBottomInsertion",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
	//for continuousRotation
    OOBBinsert("ServoFullHornCatchBottomInsertion",x=0,y=0,z=5.75,rot=90); 
    
    
        //clamping screws
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp1X,OOBB_screwClamp1Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp1X,OOBB_screwClamp1Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp1X,OOBB_screwClamp1Y,OOBBNutM3Height);
        
        
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp2X,OOBB_screwClamp2Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp2X,OOBB_screwClamp2Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp2X,OOBB_screwClamp2Y,OOBBNutM3Height);
}
///########
///########
///########  MAIN
///########




//servo holder negative (used in holder and base)
     
    //servoHolderCutoutSize = 6; //testing
    servoHolderCutoutSize = 1; //SG90
    
//servo bracket thickness (used in bracket and base)

    servoBracketThickness = 4;
    servoHolderExtraClearance = 0.5;
    OOBBbaseBoltOffset = 8;
    

module OOBB_HL_SM_03_03(){
	//######  HOLDER PART
	if( extra == "NONE" || extra=="HOLDER"  || extra=="HOLDERA"  || extra=="HOLDERB" || extra=="NOHORN"){
		translate([0,OOBBSpacing * 3,0]){
        //translate([0,0,0]){    
			OOBB_HL_SM_03_03_HOLDER();    
		}
	}
	//######  SERVO BRACKET
	if( extra == "NONE" || extra=="BRACKET" || extra=="NOHORN"){
		translate([OOBBSpacing * 2,OOBBSpacing * 2,0]){
        //translate([0,0,0]){ 
			OOBB_HL_SM_03_03_BRACKET();
		}
	}
	//###### Servo Horn
	if( extra == "NONE" || extra=="HORN"){    
		translate([OOBBSpacing * 5,OOBBSpacing * 4,0]){    
		//translate([0,0,0]){    
			OOBB_HL_SM_03_03_SERVOHORN();
		}
	}
	//######  Base
	if( extra == "NONE" || extra=="BASE" || extra=="NOHORN"){    
		translate([OOBBSpacing * 3 + 5,OOBBSpacing * 6,0]){ 
        //translate([0,0,0]){    
            
                OOBB_HL_SM_03_03_BASE();
            
		} 
	}   
}

//////////////////////////////////////////////////// SM-03-03




///########
///########
///########  HOLDER
///########
module OOBB_HL_SM_03_03_HOLDER(){
	
    spacerHeight = 12;
    extraCapHeight = 5;  //this is the amount to stretch the cap
	bearingHeight = 4;  //default to 6704
	totalHeight = spacerHeight + bearingHeight;
	capHeight = bearingHeight + 2 + extraCapHeight;
    holderBaseHeight = 12;
    
    if( extra == "NONE"|| extra=="HOLDER" || extra=="HOLDERA"  || extra=="NOHORN"){     
        translate([OOBBSpacing*2,OOBBSpacing*2.25,capHeight]){
            rotate([0,180,0]){
                translate([-OOBBSpacing*2,-OOBBSpacing*2,0]){
                    difference(){
                            OOBB_HL_SM_03_03_HOLDER_CAP(capHeight,extraCapHeight);
                            OOBB_HL_SM_03_03_HOLDER_MAINHOLES(capHeight);
                            OOBB_HL_SM_03_03_HOLDER_MAINHOLES_CAPONLY(capHeight);
                            OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(capHeight -2);
                            OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(capHeight);
                            
                        }
                    }
                }
            }
        }
    if( extra == "NONE"|| extra=="HOLDER" || extra=="HOLDERB"  || extra=="NOHORN"){     
        //holder base
        translate([0,50,capHeight-holderBaseHeight]){  //for printing
        //translate([0,0,-20]){    // fodevelopment
            difference(){
                OOBB_HL_SM_03_03_HOLDER_BASE(bearingSize, holderBaseHeight, extraCapHeight);
                OOBB_HL_SM_03_03_HOLDER_MAINHOLES(holderBaseHeight);
                OOBB_HL_SM_03_03_HOLDER_MAINHOLES_CAPONLY(holderBaseHeight);
			}
        }
    }   
        
	  
}

module OOBB_HL_SM_03_03_HOLDER_CAP(capHeight,extraCapHeight){
    difference(){
        union(){
            OOBBPLOutline3D(3,3,capHeight);
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,capHeight);
            }
        }
        TOP = 3;
        RIGHT = 3;
        BOTTOM = 1;
        LEFT = 1;
        
        //Extra bearing clearance
        translate([OOBBSpacing*2,OOBBSpacing*2,0]){
                cylinder(extraCapHeight, OOBBBearing6803OutsideHold+1, OOBBBearing6803OutsideHold+1); //.clearance given in base
            }
        
        //RIGHT TOP
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",RIGHT,TOP,capHeight,height=4,rot=180);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",RIGHT*OOBBSpacing+1,TOP*OOBBSpacing,capHeight,height=4,rot=180);
        //LEFT TOP
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",LEFT,TOP,capHeight,height=4,rot=270);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",LEFT*OOBBSpacing-1,TOP*OOBBSpacing,capHeight,height=4,rot=270);
        //RIGHT BOTTOM
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",RIGHT,BOTTOM,capHeight,height=4,rot=90);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",RIGHT*OOBBSpacing+1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=90);
        //LEFT BOTTOM
        OOBBInsertItemCoordRotate("M6BoltClearanceCorner",LEFT,BOTTOM,capHeight,height=4,rot=0);
        OOBBInsertItemMMRotate("M6BoltClearanceCorner",LEFT*OOBBSpacing-1,BOTTOM*OOBBSpacing,capHeight,height=4,rot=0);
    }
}

module OOBB_HL_SM_03_03_HOLDER_BASE(holderBaseHeight,extraCapHeight){
    difference(){
        union(){
            OOBBPLOutline3D(3,3,holderBaseHeight);
            //extra end bits to keep servo bracket from sticking out the end.
            translate([-1,0,0]){
                OOBBPLOutline3D(3,3,holderBaseHeight);
            }
            translate([1,0,0]){
                OOBBPLOutline3D(3,3,holderBaseHeight);
            }
            //bearing push up piece
            translate([OOBBSpacing*2,OOBBSpacing*2,holderBaseHeight]){
                cylinder(extraCapHeight, OOBBBearing6803OutsideHold+1-.2, OOBBBearing6803OutsideHold+1-.2); //.2 extra clearance guess Bearing push up piece
            }
        }
            OOBBInsertItemCoord("Bearing6704Little",2,2,holderBaseHeight);    
        
           
		//Servo Low
    OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,3*OOBBSpacing+2,ooZ=OOBBNutM3Height,height=20);      
    //Servo High
    OOBBInsertItemMM("M3NutCaptive",2*OOBBSpacing,1*OOBBSpacing-2,ooZ=OOBBNutM3Height,height=20);      
   
    OOBBInsertItemMM("M3NutCaptive",3*OOBBSpacing+2,2*OOBBSpacing,ooZ=OOBBNutM3Height,height=20);      
    
    OOBBInsertItemMM("M3NutCaptive",1*OOBBSpacing-2,2*OOBBSpacing,ooZ=holderBaseHeight-2,height=20);      
    
    
    
    OOBBInsertItemCoord("ServoMicroHole",2,2,height=holderBaseHeight-3);
    OOBB_HL_SM_03_03_BASE_HOLES();
    
    nutHeight = 4;
    OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=0);
    OOBBInsertItemMMRotate("M3NutCaptiveSideInsert",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=nutHeight+3,height=nutHeight,rot=180);
               
    	
    }
}


module OOBB_HL_SM_03_03_HOLDER_MAINHOLES_CAPONLY(totalHeight){

    OOBBInsertItemMM("M3Hole",3*OOBBSpacing+2,2*OOBBSpacing);      
    OOBBInsertItemMM("M3Hole",1*OOBBSpacing-2,2*OOBBSpacing);      
 //Servo Low
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,3*OOBBSpacing+2);      
    //Servo High
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing,1*OOBBSpacing-2);   
    
}

module OOBB_HL_SM_03_03_HOLDER_MAINHOLES(totalHeight){
//holes
    OOBBHole3D(1,1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-1,1*OOBBSpacing-1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-2,1*OOBBSpacing-2);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-3,1*OOBBSpacing-3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-4,1*OOBBSpacing-4);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-5,1*OOBBSpacing-5);
    
    
    OOBBHole3D(1,3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-1,3*OOBBSpacing+1);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-2,3*OOBBSpacing+2);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-3,3*OOBBSpacing+3);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-4,3*OOBBSpacing+4);
    OOBBInsertItemMM("OOBBHole",1*OOBBSpacing-5,3*OOBBSpacing+5);
    
    
    OOBBHole3D(3,1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+1,1*OOBBSpacing-1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+2,1*OOBBSpacing-2);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+3,1*OOBBSpacing-3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+4,1*OOBBSpacing-4);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+5,1*OOBBSpacing-5);
    
    
    OOBBHole3D(3,3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+1,3*OOBBSpacing+1);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+2,3*OOBBSpacing+2);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+3,3*OOBBSpacing+3);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+4,3*OOBBSpacing+4);
    OOBBInsertItemMM("OOBBHole",3*OOBBSpacing+5,3*OOBBSpacing+5);
    
    
    
    
}




module OOBB_HL_SM_03_03_HOLDER_BEARINGHOLE(totalHeight){
        OOBBInsertItemCoord("Bearing6704Hold",2,2,totalHeight);    
    
}


module OOBB_HL_SM_03_03_HOLDER_CAPTIVENUTS(capHeight){
    nutHeight = OOBBNutM3Height;
    nutGap = nutHeight;
    //Servo Low
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight);
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight-2);
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,3*OOBBSpacing+2,height=capHeight); //to allow for using 30mm bolts      
    //Servo High
    //OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight);
    //to allow for using 30mm bolts
    OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight-2); OOBBInsertItemMM("M3SocketHead",2*OOBBSpacing,1*OOBBSpacing-2,height=capHeight); //Retaining Screws
    OOBBInsertItemMM("M3SocketHead",3*OOBBSpacing+2,2*OOBBSpacing,height=capHeight);      
    OOBBInsertItemMM("M3SocketHead",1*OOBBSpacing-2,2*OOBBSpacing,height=capHeight);      
    
    

    
}



///########
///########
///########  BRACKET
///########
module OOBB_HL_SM_03_03_BRACKET(){
	difference(){
		union(){
			//servo piece
			translate([-5.35,0,0]){
				//OOBBPLOutline3DComplete(33,20,6);
				linear_extrude(servoBracketThickness){
					square([33,20],true);
				}
			}
			//piece with screw holes
			translate([0,0,0]){
				//OOBBPLOutline3DComplete(10,42,6);
				linear_extrude(servoBracketThickness){
					square([10,42],true);
				}
			}
		}
		OOBBInsertItemCoord("ServoMicroMount",0,0,height=12);
		OOBBInsertItemMM("M3Slot",0*OOBBSpacing,1*OOBBSpacing+2);
		OOBBInsertItemMM("M3Slot",0*OOBBSpacing,-1*OOBBSpacing-2);
		//2.333*OOBBSpacing,1*OOBBSpacing-2
	}
}


///########
///########
///########  SERVOHORN
///########

	
botTubeHeight=5;
topTubeHeight = 4;
	
module OOBB_HL_SM_03_03_SERVOHORN(){

	bearingTubeHeight = 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = OOBBBearing6704Inside; //default to 6704
	bearingLittle = OOBBBearing6704Little;
    totalHeight = botTubeHeight+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19
	
    topHeight = topTubeHeight + 9; //9 is wheel width
    bottomHeight = botTubeHeight + bearingTubeHeight;
        
    
    
        //TOP PIECE
    //translate([0,0,0]){
    translate([0,0,topHeight/2]){  //move to zero height
        rotate([0,180,0]){ //rotate 180 to print upside down
            translate([0,0,-bottomHeight - topHeight/2]){ //shift so centred for flip
                difference(){
                    union(){
                        //bottomTube
                        
                        
                        //topTube
                        translate([0,0,botTubeHeight+bearingTubeHeight+topTubeHeight/2  ]){
                            //cylinder(topTubeHeight,bearingLittle-0.5,bearingLittle-0.5,true);
                            cylinder(topTubeHeight,bearingInside+1,bearingInside+1,true);
                        }
                        //wheel
                        translate([0,0,totalHeight]){
                            rotate([0,180,0]){
                                OOBB_WH_SOLID(3);
                            }
                        }
                               //bearing tube
                        translate([0,0,botTubeHeight+bearingTubeHeight/2  ]){
                            cylinder(bearingTubeHeight,bearingInside,bearingInside,true);
                            } 
                    }
                    OOBB_HL_SM_03_03_SERVOHORN_HOLES();
                }
            }
        }

    }
    
        // BOTTOM PIECE
    //translate([0,0,0]){
    translate([0,-OOBBSpacing*2-3,5]){
        rotate([0,180,0]){//rotate 180 to print upside down
            difference(){
                union(){
                    
                    translate([0,0,0]){
                        //OOBBcylinder(botTubeHeight,bearingLittle-0.5,bearingLittle-0.5);
                        OOBBcylinder(botTubeHeight,bearingInside+1,bearingInside+1);
                    }
                    //bearingTube    
                    
                    
                    
                    
                    
                }
                OOBB_HL_SM_03_03_SERVOHORN_HOLES();
            }
        }
    }    
	
}


module OOBB_HL_SM_03_03_SERVOHORN_HOLES(){
    OOBB_screwClamp1X = 0; 
    OOBB_screwClamp2X = 0;
    OOBB_screwClamp1Y = 6.5;
    OOBB_screwClamp2Y = -6.5;
	
    
    
	bearingTubeHeight = 4; //default to 6704
	//bearingTubeHeight = 4; //default to 6704
	bearingInside = OOBBBearing6704Inside; //default to 6704
	bearingLittle = OOBBBearing6704Little;
    totalHeight = botTubeHeight+bearingTubeHeight+topTubeHeight+9; //2+5+3+9=19

		OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
		OOBBInsertItemCoord("OOBBHole",0,0,height=4);
		
		
	//for tg90
	//OOBBInsertItemCoord("ServoMicroHornCatchSingleBottomInsertion",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
	//for continuousRotation
    OOBBInsertItemCoord("ServoMicroHornCatchSingleContinuousBottomInsertion",0,0,3.5); 
    
    
        //clamping screws
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp1X,OOBB_screwClamp1Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp1X,OOBB_screwClamp1Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp1X,OOBB_screwClamp1Y,OOBBNutM3Height);
        
        
        OOBBInsertItemMM("M3SocketHead",OOBB_screwClamp2X,OOBB_screwClamp2Y,totalHeight);
        OOBBInsertItemMM("M3Hole",OOBB_screwClamp2X,OOBB_screwClamp2Y);
        OOBBInsertItemMM("M3NutCaptiveSingle",OOBB_screwClamp2X,OOBB_screwClamp2Y,OOBBNutM3Height);

        /*
        //blank for screw insertion
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+1);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+2);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+3);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+4);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+5);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,1*OOBBSpacing+6);
		
        //blank for screw insertion
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-1);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-2);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-3);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-4);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-5);
        OOBBInsertItemMM("OOBBHole",0*OOBBSpacing,-1*OOBBSpacing-6);
        */
}

///########
///########
///########  BASE
///########
module OOBB_HL_SM_03_03_BASE(){
	baseHeight= 18;
    servoHolderCutoutDepth=4.5;   
	union(){ 
		difference(){
			union(){
				OOBBPLOutline3D(3,3,baseHeight);
				//extra end bits to keep servo bracket from sticking out the end.
				translate([-1,0,0]){
					OOBBPLOutline3D(3,3,baseHeight);
				}
				translate([1,0,0]){
					OOBBPLOutline3D(3,3,baseHeight);
				}
			}

            
            OOBB_HL_SM_03_03_HOLDER_MAINHOLES(baseHeight);
            
			OOBBInsertItemCoord("ServoWireClearance",3,2,ooZ=baseHeight);      
			OOBBInsertItemCoord("ServoMicroHole",2,2,height=baseHeight);
			
            
            //CUTOUTS for servo nut
            //Servo Low
            OOBBInsertItemMM("M3NutClearanceSlide",2*OOBBSpacing,3*OOBBSpacing+2,ooZ=baseHeight-servoHolderCutoutDepth,height=5);      
            //Servo High
            OOBBInsertItemMM("M3NutClearanceSlide",2*OOBBSpacing,1*OOBBSpacing-2,ooZ=baseHeight-servoHolderCutoutDepth,height=5);   
 
            
            
            //OOBBbaseBoltOffset = DEFINED AT TOP
            
            
            
            OOBBInsertItemMM("M3SocketHeadUpsideDown",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=0);  
            OOBBInsertItemMM("M3SocketHeadUpsideDown",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=0);
            OOBB_HL_SM_03_03_BASE_HOLES();
           
			//servo holder negative
            
            //servoHolderCutoutSize = DEFINED AT TOP
            //servoHolderExtraClearance = DEFINED AT TOP
            
            
            
			translate([2*OOBBSpacing,2*OOBBSpacing,baseHeight-servoHolderCutoutDepth]){
                OOBB_HL_SM_03_03_BASE_SERVOBRACKETCLEARANCE(servoHolderCutoutDepth);               
        }

		}        
		//extra block added to conceal servo
		translate([OOBBSpacing * 1-6, OOBBSpacing*2,0]){
			linear_extrude(10){
				square([2,30],true);
			}
		}
	}    
}

module OOBB_HL_SM_03_03_BASE_HOLES(){
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing-OOBBbaseBoltOffset,1*OOBBSpacing,ooZ=0);
    OOBBInsertItemMM("M3Hole",2*OOBBSpacing-OOBBbaseBoltOffset,3*OOBBSpacing,ooZ=0);
}

module OOBB_HL_SM_03_03_BASE_SERVOBRACKETCLEARANCE(servoHolderCutoutDepth){
    OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    translate([0.5,0,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
    
    translate([-0.5,0,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
    
    translate([0,0.5,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
    
    translate([0,-0.5,0]){
        OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth);
    }
     
}

module OOBB_HL_SM_03_03_BASE_SERVOBRACKET(servoHolderCutoutDepth){

 //copy and pasted from bracket section, extrude height changed
              translate([-5.35,0,0]){
				//OOBBPLOutline3DComplete(33,20,6);
				linear_extrude(servoHolderCutoutDepth){
					square([33,20],true);
				}
			}
			//piece with screw holes
			translate([0,0,0]){
				//OOBBPLOutline3DComplete(10,42,6);
				linear_extrude(servoHolderCutoutDepth){
					square([10,42],true);
				}
			}
        }

    //m="WH";
    //m="HL-B1X-09-02";
    //m="OBBB-04-03";
    //m="HL-SM-03-03";
    //m="HL-TP-03-03_RA";
    //m="HL-PC-03-03";
    //m="TEST-OOEBNORMAL";
    //m="BP-6806-04-04";
    //w=5;
    //h=5;
    //extra="BRACKET";
    //extra="HOLDERA";
    //extra="HORN";
    //extra="NUTBRACKET";
    //extra="NONE";
  
  


if(m=="HL-N17-05-03"){
    OOBB_xHL_N17_05_03();    
}else if(m=="PLTEST-HoleTolerance"){
    OOBBPLTESTHoleTolerance();
}else if(m=="BP-606-03-03"){
    OOBB_BP_606_03_03();  
}else if(m=="HL-SM-03-03"){
    OOBB_HL_SM_03_03();    
}else if(m=="HL-SE-05-03"){
    OOBB_HL_SE_05_03();    
}else if(m=="HL-PZ-05-03"){
    OOBB_HL_PZ_05_03();    
}else if(m=="HL-PC-03-03"){
    OOBB_HL_PC_03_03();    
}else if(m=="WH"){
    OOBB_WH(w);    
}else if(m=="WHS"){
    OOBB_WH_SERVO(w,6803);    
}else if(m=="CI-03-CA-FL"){
    CI_03_CA_FL();    
}else if(m=="HL-B2X-07-04"){
    HL_B2X_07_04();  
}else if(m=="HL-B1X-09-02"){
    HL_B1X_09_02();  
}else if(m=="BP-6806-04-04"){
    BP_6806_04_04();    
}else if(m=="BP-6810-05-05"){
    BP_6810_05_05();    
}else if(m=="OBBB-04-03"){
    OBBB_04_03();    
}else if(m=="HL-TP-03-03"){
    OBBB_HL_TP_03_03();    
}else if(m=="HL-TP-03-03-RA"){
    OBBB_HL_TP_03_03_RA();    
}

module OBBB_04_03(){
 OBBB_04_03_TOP();
 translate([OS*3,0,1.6+10]){
 //translate([0,0,0]){
     OBBB_04_03_BOTTOM();
 }
    
}    
    
module OBBB_04_03_TOP(){
    
    //top
    difference(){
        translate([-OS*2,-OS*2.5,0]){
            difference(){
                OOBBPLOutline3D(3,4,8.5);
                OOBBHole3D(1,4);
                OOBBHole3D(2,4);
                OOBBHole3D(3,4);
            }
        }
        zz1 = 8.5;
        xx1 = 3.35;
        yy1 = 11.125;
        OOBBInsertItemMM("OOEBNormal",xx1,yy1,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*1,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*2,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*3,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*4,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*5,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*6,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*7,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*8,zz1);
        OOBBInsertItemMM("OOEBNormal",xx1,yy1-2.54*9,zz1);
        
        
        xx2 = -14.43;
        OOBBInsertItemMM("OOEBNormal",xx2,yy1,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*1,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*2,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*3,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*4,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*5,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*6,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*7,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*8,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*9,zz1);
        
        OOBBInsertItemMM("OOEBDCJA",-11.5,-21.395,14);
        OOBBInsertItemMM("OOEBDCJA",-11.5,-21.395+1,14); //extra to remove wall
        
        OOBBInsertItemMM("OOEBARDCUpsideDown",5.89,-6.337,3);
        
        
        OOBBInsertItemMM90("OOEBDual",0.81,13.65-2.54,zz1);
        
    }
}
    
module OBBB_04_03_BOTTOM(){
           
    //bottom
    translate([0,0,-1.6]){
    //translate([0,0,-1.6]){
        difference(){
            translate([-OS*2,-OS*2.5,-10]){
                difference(){
                    OOBBPLOutline3D(3,4,10);
                    OOBBHole3D(1,4);
                    OOBBHole3D(2,4);
                    OOBBHole3D(3,4);
                }
            }
        zz1 = 8.5-3;
        yy1 = 11.125;
        xx2 = -14.43;
        OOBBInsertItemMM("OOEBNormal",xx2,yy1,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*1,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*2,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*3,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*4,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*5,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*6,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*7,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*8,zz1);
        OOBBInsertItemMM("OOEBNormal",xx2,yy1-2.54*9,zz1);
        
        OOBBInsertItemMM("OOEBDCJA",-11.5,-21.395,14-3);
        OOBBInsertItemMM("OOEBDCJA",-11.5,-21.395+1,14-3); //extra to remove wall
            OOBBInsertItemMM("OOEBARDCUpsideDown",5.89,-6.337,4.5);
        }   
        
        
    }
}

module HL_B2X_07_04(){
    difference(){
        rotate([0,180,0]){     //rotate so bevel is on the top so when flipped in cura it has the bevel on the right side
            translate([-4*OOBBSpacing,-3*OOBBSpacing,-4.5]){ //put centre at 0,0
                difference(){
                    translate([0,OOBBSpacing*1,0]){ //added because size was changed after designed.
                        OOBBPLOutline3D(7,4,4.5);
                    }
                    //OOBBHole3D(1,1);
                    //OOBBHole3D(2,1);
                    //OOBBHole3D(3,1);
                    OOBBHole3D(4,1);
                    OOBBHole3D(5,1);
                    OOBBHole3D(6,1);
                    OOBBHole3D(7,1);
                    OOBBHole3D(1,5);
                    OOBBHole3D(2,5);
                    OOBBHole3D(3,5);
                    OOBBHole3D(4,5);
                    OOBBHole3D(5,5);
                    OOBBHole3D(6,5);
                    OOBBHole3D(7,5);

                }
            }
        }
            OOBBInsertItemMM("M3Hole",-47.5,16.5);   
            OOBBInsertItemMM("M3RivetUpsideDown",-47.5,16.5);   
            OOBBInsertItemMM("M3Hole",47.5,16.5);   
            OOBBInsertItemMM("M3RivetUpsideDown",47.5,16.5);   
            OOBBInsertItemMM("M3Hole",47.5,-16.5);   
            OOBBInsertItemMM("M3RivetUpsideDown",47.5,-16.5);   
            OOBBInsertItemMM("M3Hole",-47.5,-16.5);   
            OOBBInsertItemMM("M3RivetUpsideDown",-47.5,-16.5);
         //clearance for PCB components
            translate([5.5,0,0]){
                linear_extrude(4.5){      // Main Hole
                    square([77,27],true);
                }
            }
            translate([48,-27.5,0]){  //corner extrusion
                linear_extrude(4.5){
                    square([6,17],true);
                }
            }
            translate([30,-25.5,0]){  //usb port charging cutout
                linear_extrude(4.5){
                    square([30,21],true);
                }
            }
            translate([-41,-21.5,0]){  // resistor cutout
                linear_extrude(4.5){
                    square([10,5],true);
                }
            }
            translate([-39,19.5,0]){  // power button cutout
                linear_extrude(4.5){
                    square([12,7],true);
                }
            }
            translate([-44,0,0]){  // USB A cutout
                linear_extrude(4.5){
                    square([14,20],true);
                }
            }
        }
    
}

module HL_B1X_09_02(){
    
    //mode = "";
    mode="3DPR";
    
    
    holderHeight=15+3+2;
    
    if(mode== "3DPR"){
        translate([0,0,holderHeight]){
            rotate([180,0,0]){    
                HL_B1X_09_02_TOP(holderHeight);
            }
        }
        translate([0,OS*2.5,9]){
            HL_B1X_09_02_BOTTOM();
        }
    }else{
        HL_B1X_09_02_TOP(holderHeight);
        HL_B1X_09_02_BOTTOM();
    }
}
    
module HL_B1X_09_02_TOP(holderHeight){   
    extraWidth=0.25;
    
    
    
    //top main
    difference(){
    //    rotate([0,180,0]){     //rotate so bevel is on the top so when flipped in cura it has the bevel on the right side
    //        translate([-4*OOBBSpacing,-3*OOBBSpacing,-4.5]){ //put centre at 0,
        
     
        translate([-OS*5,-OS*1.5,0]){
            difference(){
                translate([0,OS*-extraWidth/2,0]){
                    OOBBPLOutline3D(9,2+extraWidth,holderHeight);
                    //OOBBPLOutline3D(9,2+extraWidth,5); //testing height
                }
                OOBBHole3D(1,1);
                OOBBHole3D(1,1.5);
                OOBBHole3D(1,2);
                OOBBHole3D(9,1);
                OOBBHole3D(9,1.5);
                OOBBHole3D(9,2);
            }
        }
        OOBBInsertItemMM("B1X",0,0,ooZ=18);
        OOBBInsertItemMM90("OOEBNormalCableUpsideDown",53,0,ooZ=-8.5);    
        OOBBInsertItemMM90("OOEBNormalCableUpsideDown",53-2,0,ooZ=-8.5);  
        OOBBInsertItemMM90("OOEBNormalCableUpsideDown",53-4,0,ooZ=-8.5); 
        OOBBInsertItemMM90("OOEBNormalCableUpsideDown",53-6,0,ooZ=-8.5); 
        OOBBInsertItemMM90("OOEBNormalCableUpsideDown",53-8,0,ooZ=-8.5); 
        OOBBInsertItemMM90("OOEBNormalCableUpsideDown",53-10,0,ooZ=-8.5);
     }
}
                            
                             
module HL_B1X_09_02_BOTTOM(){
    extraWidth=0.25;
    
     //bottom cap
    difference(){
    //    rotate([0,180,0]){     //rotate so bevel is on the top so when flipped in cura it has the bevel on the right side
    //        translate([-4*OOBBSpacing,-3*OOBBSpacing,-4.5]){ //put centre at 0,
        
     
                capHeight = 8.5;
        translate([-OS*5,-OS*1.5,0]){
            difference(){
                translate([0,OS*-extraWidth/2,-capHeight-0.5]){//extra tp take care of clearance positive to make clamping nice
                    OOBBPLOutline3D(9,2+extraWidth,capHeight);
                    //OOBBPLOutline3D(9,2+extraWidth,5); //testing height
                }
                OOBBHole3D(1,1);
                OOBBHole3D(1,1.5);
                OOBBHole3D(1,2);
                OOBBHole3D(9,1);
                OOBBHole3D(9,1.5);
                OOBBHole3D(9,2);
            }
        }
        OOBBInsertItemMM("B1X",0,0,ooZ=18);
        OOBBInsertItemMM90("OOEBNormalCableUpsideDown",53,0,ooZ=-capHeight-0.5);
        
    }
}


module CI_03_CA_FL(){
    difference(){
        OOBBCIOutline3D(3,12);
        OOBBHolesForCI3D(3);
        OOBBInsertItemCoord("CouplerFlangeM5",0,0,12);   
        //flange cutout
        cylinder(4*2,23/2,23/2,true);     
        nutHeight = 12-3;
        OOBBInsertItemCoord("M6NutCaptiveSingle",0,1,nutHeight);   
        OOBBInsertItemCoord("M6NutCaptiveSingle",1,0,nutHeight);   
        OOBBInsertItemCoord("M6NutCaptiveSingle",0,-1,nutHeight);   
        OOBBInsertItemCoord("M6NutCaptiveSingle",-1,0,nutHeight);   
    }
    
    
}

module OOBB_WH(width){
    oringCrossSection = 5.33/2;
    oringGrooveDepth = 2;
    wheelThickness = 9;
    
    extrudeRadius = (((width * OOBBSpacing - 3) + oringCrossSection*2)-oringGrooveDepth*2)  / 2;
    
    difference(){
        OOBBCI3D(width,wheelThickness);
        rotate_extrude(convexity = 10){
            translate([extrudeRadius, wheelThickness/2, 0]){
            circle(r = oringCrossSection);
            }
        }
        
        //original single
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=12);
        
        //9mm single
        OOBBInsertItemCoord("Bearing606",0,0,ooZ=7.5);
        
        //one embedded one extra
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=10.5);
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=19.5);
        
        //two sides
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=7.5);
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=16.5);
        
        //9mm two sides
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=3);
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=12);
        
    }
    
    
    
}
module OOBB_WH_SOLID(width){
    oringCrossSection = 5.33/2;
    oringGrooveDepth = 2;
    wheelThickness = 9;
    
    extrudeRadius = (((width * OOBBSpacing - 3) + oringCrossSection*2)-oringGrooveDepth*2)  / 2;
    
    difference(){
        OOBBCI3D(width,wheelThickness,middle=false);
        rotate_extrude(convexity = 10){
            translate([extrudeRadius, wheelThickness/2, 0]){
            circle(r = oringCrossSection);
            }
        }
        
        //original single
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=12);
        
        //9mm single
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=7.5);
        
        //one embedded one extra
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=10.5);
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=19.5);
        
        //two sides
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=7.5);
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=16.5);
        
        //9mm two sides
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=3);
        //OOBBInsertItemCoord("Bearing606",0,0,ooZ=12);
        
    }
    
    
    
}


module OOBB_WH_SERVO(width, bSize){
    

        //servo horn
            /*
                BASE 2.5 (both in botTube)
                HORN 1.5
                TUBE 0.5  4.5
                TUBE BIG 2
                NUT GAP 5
                TOP 3
            */
            botTubeHeight = bSize==6803 ? 5.5 : 4.5; //default to 6704
            bearingInside = bSize==6803 ? OOBBBearing6803Inside : OOBBBearing6704Inside; //default to 6704
            bigTubeHeight = 2;
            armHeight = 3+OOBBNutM6Height;
            totalHeight = botTubeHeight+bigTubeHeight+armHeight;
    
        union(){
        translate([0,0,botTubeHeight+bigTubeHeight]){
        OOBB_WH_SOLID(width);
        }
            difference(){

                union(){
                    
                    
                    //bottomTube
                    
                    translate([0,0,0]){
                        OOBBcylinder(botTubeHeight,bearingInside,bearingInside);
                    }
                    //bigTube    
                    
                    translate([0,0,botTubeHeight+bigTubeHeight/2]){
                        cylinder(bigTubeHeight,24/2,24/2,true);
                    }
                    //arm
                    translate([0,0,12]){
                        cylinder(9,20/2,20/2,true);
                    }
                }
                
               
                OOBBHole3D(0,0);
                OOBBInsertItemCoord("ServoMicroHornHole",0,0,height=4);
                OOBBInsertItemCoord("ServoMicroHornCatchSingle",0,0,4); //allows for 1.5mm thick arm and 2.5mm thick adapter tube
            }
            
        }
        
        
}


module OOBB_HL_PZ_05_03(){
  difference(){
      union(){
        OOBBPLOutline3D(5,3,3);
        //extra end bits to keep servo bracket from sticking out the end.
        translate([0,-1.5,0]){
           OOBBPLOutline3D(5,3,3);
        }
       } 
        OOBBHole3D(1,3);
        OOBBHole3D(2,3);
        OOBBHole3D(3,3);
        OOBBHole3D(4,3);
        OOBBHole3D(5,3);
        
        OOBBInsertItemCoord180("PiZeroMountUpsideDown",3,1.5,0);

        
   }
}
module OOBB_HL_PC_03_03(){
  difference(){
        OOBBPLOutline3D(3,3,3);
        OOBBHole3D(1,3);
        OOBBHole3D(2,3);
        OOBBHole3D(3,3);
        OOBBHole3D(3,1);
        OOBBHole3D(3,2);

        
        OOBBInsertItemMM("PiCameraMount",OOBBSpacing*1.5,OOBBSpacing*2-6,3);
        translate([OOBBSpacing*1.5,OOBBSpacing*2-6,00]){  //extra m2 holes to get the bevel at z=0  
          OOBBInsertItemMM("M2Hole",-10.5,10,0);
          OOBBInsertItemMM("M2Hole",-10.5,-2.5,0);
          OOBBInsertItemMM("M2Hole",10.5,10,0);
          OOBBInsertItemMM("M2Hole",10.5,-2.5,0);
        }
      
      
      
        
   }
}



module OOBB_HL_N17_05_03(){
    
    OOWidth = 5;
    OOHeight = 3;    
    difference(){
        OOBBPLOutline3D(OOWidth,OOHeight,9);
        //OOBB Holes
        //Left side holes
        OOBBHole3D(1,1);
        //OOBBSlotTall3D(1,1);
        //OOBBSlotWide3D(1,1);        
        OOBBHole3D(1,2);
        //OOBBSlotTall3D(1,2);
        //OOBBSlotWide3D(1,2);        
        OOBBHole3D(1,3);
        //OOBBSlotWide3D(1,3);        
        
        //right side holes
        OOBBHole3D(5,1);
        //OOBBSlotTall3D(5,1);
        //OOBBSlotWide3D(4,1);        
        OOBBHole3D(5,2);
        //OOBBSlotTall3D(5,2);
        //OOBBSlotWide3D(4,2);                
        OOBBHole3D(5,3);
        //OOBBSlotWide3D(4,3);        
        
        //slots around NEMA17 Mount
        //OOBBSlotWide3D(2,1);       
        //OOBBSlotWide3D(2,3);       
        //OOBBSlotWide3D(3,1);       
        //OOBBSlotWide3D(3,3);       
        
        //OOBBSlotTall3D(2,1);       
        //OOBBSlotTall3D(2,2);       
        //OOBBSlotTall3D(4,1);       
        //OOBBSlotTall3D(4,2);       
        
        
        
        OOBBInsertItemCoord("NEMA17",3,2,ooZ=9);
        
        //all the way through hole (to facilitate 19mm OD flexible coupler)        
        OOBBHole3DRadius(3*OS,2*OS,22/2);
        //25mm hole for clearance of metal outie bit on a NEMA17 motor
        OOBBHole3DRadiusComplete(3*OS,2*OS,25/2,3.575+4.85,9-6);    
        OOBBInsertItemCoord("SetScrewKeyway",3,2,ooZ=4.5);    
        
    }
    
        
    
    
}


module OOBB_BP_606_03_03(){
    if(extra == "SANDWICH"){
        translate([2*OOBBSpacing,2*OOBBSpacing,0]){
            OOBB_BP_606_03_03_HALF();
        }
        translate([2*OOBBSpacing,5*OOBBSpacing,0]){
            mirror([1,0,0]){
                    OOBB_BP_606_03_03_HALF();
            }
        }
    }else{
       OOBB_BP_606_03_03_FULL ();
    }
}

module OOBB_BP_606_03_03_HALF(){
    OOWidth = 3;
    OOHeight = 3;    
    translate([-2*OOBBSpacing,-2*OOBBSpacing,0]){
        difference(){
            OOBBPLOutline3D(OOWidth,OOHeight,4.5);
            //OOBB Holes
            OOBBHole3D(1,1);
            //OOBBSlotTall3D(1,1);
            //OOBBSlotWide3D(1,1);
            OOBBHole3D(1,2);
            //OOBBSlotTall3D(1,2);
            OOBBHole3D(1,3);
            //OOBBSlotWide3D(1,3);
            
            OOBBHole3D(3,1);
            //OOBBSlotTall3D(3,1);
            
            OOBBHole3D(3,2);
            //OOBBSlotTall3D(3,2);
            OOBBHole3D(3,3);
            
            OOBBHole3D(2,1);
            //OOBBSlotWide3D(2,1);
            OOBBHole3D(2,3);
            //OOBBSlotWide3D(2,3);
            
            OOBBInsertItemCoord("Bearing606",2,2,ooZ=7.5);
            OOBBInsertItemCoord("BearingJoiner0303",0,0);
            
            
        }
        
    }
    
    
}

module OBBB_HL_TP_03_03()    {
    OOWidth = 3;
    OOHeight = 3;    
    difference(){
        OOBBPLOutline3D(OOWidth,OOHeight,9);
        //OOBB Holes
        OOBBHole3D(1,1);
        //OOBBSlotTall3D(1,1);
        //OOBBSlotWide3D(1,1);
        OOBBHole3D(1,2);
        //OOBBSlotTall3D(1,2);
        OOBBHole3D(1,3);
        //OOBBSlotWide3D(1,3);
        
        OOBBHole3D(3,1);
        //OOBBSlotTall3D(3,1);
        
        OOBBHole3D(3,2);
        //OOBBSlotTall3D(3,2);
        OOBBHole3D(3,3);
        
        OOBBHole3D(2,1);
        //OOBBSlotWide3D(2,1);
        OOBBHole3D(2,3);
        //OOBBSlotWide3D(2,3);
        OOBBInsertItemCoord("TripodNutCaptive",2,2,ooZ=7.5);
      OOBBInsertItemCoord("M7Hole",2,2);
    }
    
}

module OBBB_HL_TP_03_03_RA()    {
    OOWidth = 3;
    OOHeight = 3;    
    difference(){
        OOBBPLOutline3D(OOWidth,OOHeight,12);
        //OOBB Holes
        
        OOBBHole3D(2,1);
        //OOBBSlotWide3D(2,1);
        OOBBHole3D(2,3);
        //OOBBSlotWide3D(2,3);
        OOBBInsertItemCoord("TripodNutCaptive",2,2,ooZ=7.5);
      OOBBInsertItemCoord("M7Hole",2,2);
        OOBBInsertItemCoordRotateX("OOBBHole",1,6,rot=90,ooZ=6);        
    OOBBInsertItemCoordRotateX("OOBBHole",3,6,rot=90,ooZ=6);        
    }
    
}


module OOBB_BP_606_03_03_FULL(){
    OOWidth = 3;
    OOHeight = 3;    
    //outside
    difference(){
        OOBBPLOutline3D(OOWidth,OOHeight,9);
        //OOBB Holes
        OOBBHole3D(1,1);
        //OOBBSlotTall3D(1,1);
        //OOBBSlotWide3D(1,1);
        OOBBHole3D(1,2);
        //OOBBSlotTall3D(1,2);
        OOBBHole3D(1,3);
        //OOBBSlotWide3D(1,3);
        
        OOBBHole3D(3,1);
        //OOBBSlotTall3D(3,1);
        
        OOBBHole3D(3,2);
        //OOBBSlotTall3D(3,2);
        OOBBHole3D(3,3);
        
        OOBBHole3D(2,1);
        //OOBBSlotWide3D(2,1);
        OOBBHole3D(2,3);
        //OOBBSlotWide3D(2,3);
        
        OOBBInsertItemCoord("Bearing606",2,2,ooZ=7.5);       
    }
    
    
    
    
}






module OOBBnema17Holes(x,y,z){
    translate([x,y,-10]){
//        OOBBCountersinkM33DComplete(31/2,31/2,z+10);
//        OOBBHole3DRadius(31/2,31/2,OOBBm3Hole);
//        OOBBCountersinkM33DComplete(-31/2,-31/2,z+10);
//        OOBBHole3DRadius(-31/2,-31/2,OOBBm3Hole);
//        OOBBCountersinkM33DComplete(31/2,-31/2,z+10);
//        OOBBHole3DRadius(31/2,-31/2,OOBBm3Hole);
//        OOBBCountersinkM33DComplete(-31/2,31/2,z+10);
//        OOBBHole3DRadius(-31/2,31/2,OOBBm3Hole);
    }
}

    
    


if(m=="PLTEST-HoleTolerance"){
    OOBBPLTESTHoleTolerance();
}else if(m=="TEST-SERVOHORN"){
    TEST_SERVOHORN();    
}else if(m=="TEST-BEARING6704-OUTSIDE"){
    TEST_BEARING6704();   
}else if(m=="TEST-BEARING6704-MIDDLE"){
    TEST_BEARING6704_MIDDLE();    
}else if(m=="TEST-BEARING6803-OUTSIDE"){
    TEST_BEARING6803();    
}else if(m=="TEST-BEARING6803-MIDDLE"){
    TEST_BEARING6803_MIDDLE();    
}else if(m=="TEST-COUNTERSINKM3"){
    TEST_COUNTERSINKM3();    
}else if(m=="TEST-SOCKETHEADM3"){
    TEST_SOCKETHEADM3();    
}else if(m=="TEST-SERVOMICROHORNCATCH"){
    TEST_SERVOMICROHORNCATCH();    
}else if(m=="TEST-SERVOMICROHORNCATCHSINGLE"){
    TEST_SERVOMICROHORNCATCHSINGLE();    
}else if(m=="TEST-SERVOMICROHORNCATCHSINGLECONTINUOUS"){
    TEST_SERVOMICROHORNCATCHSINGLECONTINUOUS();    
}else if(m=="TEST-FIRSTLAYERLIP"){
    TEST_FIRSTLAYERLIP();    
}else if(m=="TEST-OOEBNORMAL"){
    TEST_OOEBNORMAL();    
}

module TEST_FIRSTLAYERLIP(){
    difference(){
        OOBBPLOutline3D(3, 2, 6);
    }
}

module TEST_BEARING6704(){
    
    difference(){
        OOBBPLOutline3D(5, 7, 6);
        
        OOBBHole3DRadiusComplete(25,25,OOBBBearing6704OutsideHoldTrue,4,6);
        OOBBHole3DRadiusComplete(25,25,OOBBBearing6704Little,100,50);
        
        OOBBHole3DRadiusComplete(25,55,OOBBBearing6704OutsideHoldTrue+.1,4,6);
        OOBBHole3DRadiusComplete(25,55,OOBBBearing6704Little,100,50);
        
        OOBBHole3DRadiusComplete(25,85,OOBBBearing6704OutsideHoldTrue+.2,4,6);
        OOBBHole3DRadiusComplete(25,85,OOBBBearing6704Little,100,50);
        
        
        OOBBHole3DRadiusComplete(55,25,OOBBBearing6704OutsideHoldTrue+.3,4,6);
        OOBBHole3DRadiusComplete(55,25,OOBBBearing6704Little,100,50);
        
        OOBBHole3DRadiusComplete(55,55,OOBBBearing6704OutsideHoldTrue+.4,4,6);
        OOBBHole3DRadiusComplete(55,55,OOBBBearing6704Little,100,50);
        
    }
}


module TEST_BEARING6704_MIDDLE(){
    
    union(){
        OOBBPLOutline3D(5, 7, 3);
        
        OOBBHole3DRadiusSimple(25,25,OOBBBearing6704InsideTrue+0,10,10);
        OOBBHole3DRadiusSimple(25,25,OOBBBearing6704Little+0,5,5);
        
        OOBBHole3DRadiusSimple(25,55,OOBBBearing6704InsideTrue-0.050,10,10);
        OOBBHole3DRadiusSimple(25,55,OOBBBearing6704Little+0,5,5);
        
        OOBBHole3DRadiusSimple(25,85,OOBBBearing6704InsideTrue-0.1,10,10);
        OOBBHole3DRadiusSimple(25,85,OOBBBearing6704Little+0,5,5);
        
        OOBBHole3DRadiusSimple(55,25,OOBBBearing6704InsideTrue-0.15,10,10);
        OOBBHole3DRadiusSimple(55,25,OOBBBearing6704Little+0,5,5);
        
        OOBBHole3DRadiusSimple(55,55,OOBBBearing6704InsideTrue-0.2,10,10);
        OOBBHole3DRadiusSimple(55,55,OOBBBearing6704Little+0,5,5);
        
        
    }
}
    

module TEST_BEARING6803(){
    
    difference(){
        OOBBPLOutline3D(5, 7, 7);
        
        OOBBHole3DRadiusComplete(25,25,OOBBBearing6803OutsideHoldTrue,5,7);
        OOBBHole3DRadiusComplete(25,25,OOBBBearing6803Little,100,50);
        
        OOBBHole3DRadiusComplete(25,55,OOBBBearing6803OutsideHoldTrue+.1,5,7);
        OOBBHole3DRadiusComplete(25,55,OOBBBearing6803Little,100,50);
        
        OOBBHole3DRadiusComplete(25,85,OOBBBearing6803OutsideHoldTrue+.2,5,7);
        OOBBHole3DRadiusComplete(25,85,OOBBBearing6803Little,100,50);
        
        
        OOBBHole3DRadiusComplete(55,25,OOBBBearing6803OutsideHoldTrue+.3,5,7);
        OOBBHole3DRadiusComplete(55,25,OOBBBearing6803Little,100,50);
        
        OOBBHole3DRadiusComplete(55,55,OOBBBearing6803OutsideHoldTrue+.4,5,7);
        OOBBHole3DRadiusComplete(55,55,OOBBBearing6803Little,100,50);
        
    }
}


module TEST_BEARING6803_MIDDLE(){
    
    union(){
        OOBBPLOutline3D(5, 7, 3);
        
        OOBBHole3DRadiusSimple(25,25,OOBBBearing6803InsideTrue+0,10,10);
        OOBBHole3DRadiusSimple(25,25,OOBBBearing6803Little+0,5,5);
        
        OOBBHole3DRadiusSimple(25,55,OOBBBearing6803InsideTrue-0.050,10,10);
        OOBBHole3DRadiusSimple(25,55,OOBBBearing6803Little+0,5,5);
        
        OOBBHole3DRadiusSimple(25,85,OOBBBearing6803InsideTrue-0.1,10,10);
        OOBBHole3DRadiusSimple(25,85,OOBBBearing6803Little+0,5,5);
        
        OOBBHole3DRadiusSimple(55,25,OOBBBearing6803InsideTrue-0.15,10,10);
        OOBBHole3DRadiusSimple(55,25,OOBBBearing6803Little+0,5,5);
        
        OOBBHole3DRadiusSimple(55,55,OOBBBearing6803InsideTrue-0.2,10,10);
        OOBBHole3DRadiusSimple(55,55,OOBBBearing6803Little+0,5,5);
        
        
    }
}
    
        
        
module TEST_SERVOHORN(){
    
    difference(){
        OOBBPLOutline3D(2, 3, 6);
        height = 20;
        rad=7.2/2;
        OOBBHole3DRadiusComplete(OOBBSpacing * 1,OOBBSpacing * 1,rad,height,height-5);
        rad1=7.4/2;
        OOBBHole3DRadiusComplete(OOBBSpacing * 1,OOBBSpacing * 2,rad1,height,height-5);
        rad2=7.6/2;
        OOBBHole3DRadiusComplete(OOBBSpacing * 1,OOBBSpacing * 3,rad2,height,height-5);
        rad3=7.8/2;
        OOBBHole3DRadiusComplete(OOBBSpacing * 2,OOBBSpacing * 1,rad3,height,height-5);
        rad4=8.0/2;
        OOBBHole3DRadiusComplete(OOBBSpacing * 2,OOBBSpacing * 2,rad4,height,height-5);

    }
}


module OOBBPLTESTHoleTolerance(){
    linear_extrude(3){
        difference(){
        OOBBPLOutline(4, 3);


            for(x=[0:8]){    
                OOx = floor(x%3)+1;
                OOy = floor(x/3)+1;
                OOoffset = -0.1 + 0.1 *x;
                translate([OOBBSpacing * OOx, OOBBSpacing * OOy]){
                    circle(OOBBHole + OOoffset);
                }
                translate([OOBBSpacing * OOx + OOBBSpacing/2, OOBBSpacing * OOy]){
                    square([OOBBTabWidth+OOoffset,OOBBTabHeight+OOoffset],true);
                }    
            }
        }
    }
}

module TEST_COUNTERSINKM3(){
    difference(){
        OOBBPLOutline3D(2, 4, 10);
        
        
        
        xVal1 = 1;
        yVal1 = 1;
        top = OOBBm3CounterSinkTopHoleTrue;
        bot = OOBBm3Hole;
        height = 1.9; //true is 1.75
        OOBBCountersink3DComplete(OOBBSpacing*xVal1,OOBBSpacing*yVal1,top,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal1,yVal1);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal1,yVal1,ooZ=OOBBNutM3Height);   
    
        
        xVal2 = 1;
        yVal2 = 1.75;
        top2 = OOBBm3CounterSinkTopHoleTrue + 0.1;
        OOBBCountersink3DComplete(OOBBSpacing*xVal2,OOBBSpacing*yVal2,top2,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal2,yVal2);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal2,yVal2,ooZ=OOBBNutM3Height);
        
        xVal3 = 1;
        yVal3 = 2.5;
        top3 = OOBBm3CounterSinkTopHoleTrue + 0.2;
        OOBBCountersink3DComplete(OOBBSpacing*xVal3,OOBBSpacing*yVal3,top3,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal3,yVal3);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal3,yVal3,ooZ=OOBBNutM3Height);
    
        
        xVal4 = 1;
        yVal4 = 3.25;
        top4 = OOBBm3CounterSinkTopHoleTrue + 0.3;
    OOBBCountersink3DComplete(OOBBSpacing*xVal4,OOBBSpacing*yVal4,top4,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal4,yVal4);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal4,yVal4,ooZ=OOBBNutM3Height);
        
        xVal5 = 1;
        yVal5 = 4;
        top5 = OOBBm3CounterSinkTopHoleTrue + 0.4;
        OOBBCountersink3DComplete(OOBBSpacing*xVal5,OOBBSpacing*yVal5,top5,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal5,yVal5);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal5,yVal5,ooZ=OOBBNutM3Height);
        
        xVal6 = 2;
        yVal6 = 1;
        top6 = OOBBm3CounterSinkTopHoleTrue + 0.5;
        OOBBCountersink3DComplete(OOBBSpacing*xVal6,OOBBSpacing*yVal6,top6,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal6,yVal6);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal6,yVal6,ooZ=OOBBNutM3Height);
        
        
        //CURRENT CHOICE
        xVal7 = 2;
        yVal7 = 1.75;
        top7 = OOBBm3CounterSinkTopHoleTrue +0.6;
        OOBBCountersink3DComplete(OOBBSpacing*xVal7,OOBBSpacing*yVal7,top7,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal7,yVal7);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal7,yVal7,ooZ=OOBBNutM3Height);
        
        xVal8 = 2;
        yVal8 = 2.5;
        top8 = OOBBm3CounterSinkTopHoleTrue + 0.7;
        OOBBCountersink3DComplete(OOBBSpacing*xVal8,OOBBSpacing*yVal8,top8,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal8,yVal8);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal8,yVal8,ooZ=OOBBNutM3Height);
        
        xVal9 = 2;
        yVal9 = 3.25;
        top9 = OOBBm3CounterSinkTopHoleTrue + 0.8;
        OOBBCountersink3DComplete(OOBBSpacing*xVal9,OOBBSpacing*yVal9,top9,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal9,yVal9);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal9,yVal9,ooZ=OOBBNutM3Height);
    }
}



module TEST_SOCKETHEADM3(){
    difference(){
        OOBBPLOutline3D(2, 4, 10);
        
        
        
        xVal1 = 1;
        yVal1 = 1;
        top = OOBBm3SocketHeadHoleTrue;
        bot = OOBBm3SocketHeadHoleTrue;
        height = 3; //true is 1.75
        OOBBCountersink3DComplete(OOBBSpacing*xVal1,OOBBSpacing*yVal1,top,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal1,yVal1);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal1,yVal1,ooZ=OOBBNutM3Height);   
    
        
        xVal2 = 1;
        yVal2 = 1.75;
        top2 = OOBBm3SocketHeadHoleTrue + 0.1;
        OOBBCountersink3DComplete(OOBBSpacing*xVal2,OOBBSpacing*yVal2,top2,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal2,yVal2);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal2,yVal2,ooZ=OOBBNutM3Height);
        
        xVal3 = 1;
        yVal3 = 2.5;
        top3 = OOBBm3SocketHeadHoleTrue + 0.2;
        OOBBCountersink3DComplete(OOBBSpacing*xVal3,OOBBSpacing*yVal3,top3,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal3,yVal3);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal3,yVal3,ooZ=OOBBNutM3Height);
    
        
        xVal4 = 1;
        yVal4 = 3.25;
        top4 = OOBBm3SocketHeadHoleTrue + 0.3;
    OOBBCountersink3DComplete(OOBBSpacing*xVal4,OOBBSpacing*yVal4,top4,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal4,yVal4);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal4,yVal4,ooZ=OOBBNutM3Height);
        
        xVal5 = 1;
        yVal5 = 4;
        top5 = OOBBm3SocketHeadHoleTrue + 0.4;
        OOBBCountersink3DComplete(OOBBSpacing*xVal5,OOBBSpacing*yVal5,top5,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal5,yVal5);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal5,yVal5,ooZ=OOBBNutM3Height);
        
        xVal6 = 2;
        yVal6 = 1;
        top6 = OOBBm3SocketHeadHoleTrue + 0.5;
        OOBBCountersink3DComplete(OOBBSpacing*xVal6,OOBBSpacing*yVal6,top6,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal6,yVal6);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal6,yVal6,ooZ=OOBBNutM3Height);
        
        
        //CURRENT CHOICE
        xVal7 = 2;
        yVal7 = 1.75;
        top7 = OOBBm3SocketHeadHoleTrue +0.6;
        OOBBCountersink3DComplete(OOBBSpacing*xVal7,OOBBSpacing*yVal7,top7,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal7,yVal7);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal7,yVal7,ooZ=OOBBNutM3Height);
        
        xVal8 = 2;
        yVal8 = 2.5;
        top8 = OOBBm3SocketHeadHoleTrue + 0.7;
        OOBBCountersink3DComplete(OOBBSpacing*xVal8,OOBBSpacing*yVal8,top8,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal8,yVal8);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal8,yVal8,ooZ=OOBBNutM3Height);
        
        xVal9 = 2;
        yVal9 = 3.25;
        top9 = OOBBm3SocketHeadHoleTrue + 0.8;
        OOBBCountersink3DComplete(OOBBSpacing*xVal9,OOBBSpacing*yVal9,top9,bot,height,10);
        OOBBInsertItemCoord("M3Hole",xVal9,yVal9);   
        OOBBInsertItemCoord("M3NutCaptiveSingle",xVal9,yVal9,ooZ=OOBBNutM3Height);
    }
}

module TEST_SERVOMICROHORNCATCH(){
    difference(){
        OOBBPLOutline3D(3, 4.5, 3.75);
        
        //1
        translate([OOBBSpacing *2,OOBBSpacing*1,0]){
            union(){
                extension=0;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,-1.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      #square([15,5.25+extension],true);
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }translate([-7.5-(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
        
        
        //2
        translate([OOBBSpacing *2,OOBBSpacing*2,0]){
            union(){
                extension=0.1;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      #square([15,5.25+extension],true);
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }translate([-7.5-(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
        
        //3
        translate([OOBBSpacing *2,OOBBSpacing*3,0]){
            union(){
                extension=0.2;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      #square([15,5.25+extension],true);
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }translate([-7.5-(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
        
        //4
        translate([OOBBSpacing *2,OOBBSpacing*4,0]){
            union(){
                extension=0.3;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      #square([15,5.25+extension],true);
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }translate([-7.5-(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
    }
}

module TEST_SERVOMICROHORNCATCHSINGLE(){
      difference(){
          translate([OOBBSpacing*1,0,0]){
            OOBBPLOutline3D(2, 4.5, 3.75);
          }
        
        //1
        translate([OOBBSpacing *2,OOBBSpacing*1,0]){
          union(){
                extension=0;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      translate([7.5/2,0,0]){
                        square([7.5,5.25+extension],true);
                      }
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
        
        
        //2
        translate([OOBBSpacing *2,OOBBSpacing*2,0]){
            union(){
                extension=0.1;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      translate([7.5/2,0,0]){
                        square([7.5,5.25+extension],true);
                      }
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
        
        //3
        translate([OOBBSpacing *2,OOBBSpacing*3,0]){
            union(){
                extension=0.2;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      translate([7.5/2,0,0]){
                        square([7.5,5.25+extension],true);
                      }
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
        
        //4
        translate([OOBBSpacing *2,OOBBSpacing*4,0]){
            union(){
                extension=0.3;
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(1.5){
                      translate([7.5/2,0,0]){
                        square([7.5,5.25+extension],true);
                      }
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
        
    }
}




module TEST_SERVOMICROHORNCATCHSINGLECONTINUOUS(){
      difference(){
          translate([OOBBSpacing*1,0,0]){
            OOBBPLOutline3D(2, 1, 4.25);
            //OOBBPLOutline3D(2, 4.5, 3.75);
          }
        
        //1
            TS(0,1);
            //TS(0.1,2);
            //TS(0.2,3);
            //TS(0.3,4);
    }
}

module TS(extension,shift){
    translate([OOBBSpacing *2,OOBBSpacing*shift,0]){
          union(){
                
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2.5]){
                   rad=7.4/2; 
                   linear_extrude(2){
                      
                      translate([4/2,0,0]){
                        square([4,7.1+extension],true);
                      }
                      
                      translate([5.5/2,0,0]){
                        square([8.5,6.1+extension],true);
                      }
                      
                      translate([8.5+(9/2),0,0]){
                        square([14,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
}

module TEST_OOEBNORMAL(){
    
    //mode="";
    mode="3DPR";
    
    if(mode=="3DPR"){
        translate([0,0,17]){
            rotate([0,180,0]){
                TEST_OOEBNORMAL_TOP();
            }
        }
        translate([OS*3,0,0]){
            rotate([0,180,0]){
                TEST_OOEBNORMAL_BOTTOM();
            }
        }    
    }else{
        TEST_OOEBNORMAL_TOP();
        TEST_OOEBNORMAL_BOTTOM();
    }
}

module TEST_OOEBNORMAL_TOP(){
    difference(){
        translate([-OS*2,-OS*2,0]){
            OOBBPLOutline3D(3, 3, 17);
        }
        TEXT_OOEBNORMAL_HOLES();
    }
}

module TEST_OOEBNORMAL_BOTTOM(){
    difference(){
        translate([-OS*2,-OS*2,-6]){
            OOBBPLOutline3D(3, 3, 6);
        }
        TEXT_OOEBNORMAL_HOLES();
    }
}

module TEXT_OOEBNORMAL_HOLES(){
    he = -6;
    st = -16;
    sp = 8;
    xx1 = 0;
    #OOBBInsertItemMM("OOEBNormalCableUpsideDown",xx1,st+0*sp,he,ex=0.1);
    #OOBBInsertItemMM("OOEBNormalCableUpsideDown",xx1,st+1*sp,he,ex=0.2);
    #OOBBInsertItemMM("OOEBNormalCableUpsideDown",xx1,st+2*sp,he,ex=0.3);
    #OOBBInsertItemMM("OOEBNormalCableUpsideDown",xx1,st+3*sp,he,ex=0.4);
    #OOBBInsertItemMM("OOEBNormalCableUpsideDown",xx1,st+4*sp,he,ex=0.5);
    
}//######  OOBB OpenSCAD Generation  ######
//########################################

//#########################################################################################
//#########################################################################################
//#########          INSERT ROUTINES


module OOBBinsert(item,x=0,y=0,z=0,height=0,width=0,length=0,rot=0,rotY=0,rotX=0,ex=0){
    //OOBBInsertItemMMRotate(item,ooX,ooY,ooZ=0,height=0,rot=0,ex=0)
    OOBBInsertItemMMRotate(item,ooX=x,ooY=y,ooZ=z,height=height,rot=rot,rotX=rotX,rotY=rotY,ex=ex,length=length);
}



/////////////////////////////////////////// OLD VERSIONS



module OOBBInsertItemCoord(item,ooX,ooY,ooZ=0,height=0,ex=0){
    OOBBInsertItemMM(item,ooX*OOBBSpacing,ooY*OOBBSpacing,ooZ=ooZ,height=height,ex=ex);    
}

module OOBBInsertItemCoord180(item,ooX,ooY,ooZ=0,height=0,ex=0){
    translate([ooX*OOBBSpacing,ooY*OOBBSpacing,0]){
        rotate([0,0,180]){    
            OOBBInsertItemCoord(item,0,0,ooZ=ooZ,height=height,ex=ex);    
        }
    }
}



module OOBBInsertItemCoord90(item,ooX,ooY,ooZ=0,height=0,ex=0){
    translate([ooX*OOBBSpacing,ooY*OOBBSpacing,0]){
        rotate([0,0,90]){    
            OOBBInsertItemCoord(item,0,0,ooZ=ooZ,height=height,ex=ex);    
        }
    }
}


module OOBBInsertItemCoordRotate(item,ooX,ooY,ooZ=0,height=0,rot=0,ex=0){
    translate([ooX*OOBBSpacing,ooY*OOBBSpacing,0]){
        rotate([0,0,rot]){    
            OOBBInsertItemCoord(item,0,0,ooZ=ooZ,height=height,ex=ex);    
        }
    }
}

module OOBBInsertItemCoordRotateX(item,ooX,ooY,ooZ=0,height=0,rot=0,ex=0){
    translate([ooX*OOBBSpacing,ooY*OOBBSpacing,ooZ]){
        rotate([rot,0,0]){    
            OOBBInsertItemCoord(item,0,0,ooZ=ooZ,height=height,ex=ex);    
        }
    }
}



module OOBBInsertItemMM180(item,ooX,ooY,ooZ=0,height=0,ex=0){
    translate([ooX,ooY,0]){
        rotate([0,0,180]){
            OOBBInsertItemCoord(item,0,0,ooZ=ooZ,height=height,ex=ex);    
        }
    }
}

module OOBBInsertItemMM90(item,ooX,ooY,ooZ=0,height=0,ex=0){
    translate([ooX,ooY,0]){
        rotate([0,0,90]){
            OOBBInsertItemCoord(item,0,0,ooZ=ooZ,height=height,ex=ex);    
        }
    }
}

module OOBBInsertItemMMRotate(item,ooX,ooY,ooZ=0,height=0,rot=0,ex=0,length=0,rotX=0,rotY=0){
    translate([ooX,ooY,0]){
        rotate([rotX,rotY,rot]){
            OOBBInsertItemMM(item,0,0,ooZ=ooZ,height=height,ex=ex,length=length);
            }
    }
}

module OOBBInsertItemMM(item,ooX,ooY,ooZ=0,height=0,ex=0,length=0){
    translate([ooX,ooY,ooZ]){
        if(item=="OOBBHole"){
            height=100;    
            z=height-10;
            rad=OOBBHole;
            OOBBHole3DRadiusComplete(0,0,rad,height,z);
        }
        if(item=="OOBBHoleSlot"){
            OOBBinsert("OOBBHole");
            OOBBinsert("OOBBHole",x=-1,y=-1);
            OOBBinsert("OOBBHole",x=-2,y=-2);
            OOBBinsert("OOBBHole",x=-3,y=-3);
            OOBBinsert("OOBBHole",x=-4,y=-4);
            OOBBinsert("OOBBHole",x=-5,y=-5);
        }
        if(item=="OOBBHole2D"){
            height=50;    
            z=height-10;
            rad=OOBBHole;
            circle(rad);
        }
        if(item=="M2Rivet"){
            height=50;    
            z=height-10;
            rad=OOBBm2Hole;
            rad2=5.2/2;
            OOBBHole3DRadiusComplete(0,0,rad,height,0);
            OOBBHole3DRadiusComplete(0,0,rad2,1.5,1.5);
        }
        if(item=="M2RivetUpsideDown"){
            h=50;    
            z=h-10-height;
            rad=OOBBm2Hole;
            rad2=5.2/2;
            OOBBHole3DRadiusComplete(0,0,rad,h,z);
            OOBBHole3DRadiusComplete(0,0,rad2,1.5,0);
        }
        if(item=="M27Rivet"){
            height=50;    
            z=height-10;
            rad=OOBBm27Hole;
            rad2=5/2;
            OOBBHole3DRadiusComplete(0,0,rad,height,z);
            OOBBHole3DRadiusComplete(0,0,rad2,1.5,0);
        }
        if(item=="M27RivetUpsideDown"){
            height=50;    
            z=height-10;
            rad=OOBBm27Hole;
            rad2=OOBBm27RivetClearance;
            OOBBHole3DRadiusComplete(0,0,rad,height,z);
            OOBBHole3DRadiusComplete(0,0,rad2,1.5,1.5);
        }
        if(item=="M3Rivet"){
            height=50;    
            z=height-10;
            rad=OOBBm3Hole;
            rad2=(7+0.2)/2;
            OOBBHole3DRadiusComplete(0,0,rad,height,0);
            OOBBHole3DRadiusComplete(0,0,rad2,1.5,1.5);
        }
        if(item=="M3RivetUpsideDown"){
            h=50;    
            z=h-10-height;
            rad=OOBBm3Hole;
            rad2=(7+0.2)/2;
            OOBBHole3DRadiusComplete(0,0,rad,h,z);
            OOBBHole3DRadiusComplete(0,0,rad2,1.5,1.5);
        }
        if(item=="M3Countersink"){
            top = OOBBm3CounterSinkTopHole;
            bot = OOBBm3Hole;
            height = OOBBm3CounterSinkDepth;
            OOBBCountersink3DComplete(0,0,top,bot,height,height);
        }
        if(item=="M3CountersinkUpsideDown"){
            top = OOBBm3CounterSinkTopHole;
            bot = OOBBm3Hole;
            height = OOBBm3CounterSinkDepth;
            OOBBCountersink3DComplete(0,0,bot,top,height,height);
        }
        if(item=="M3SocketHead"){
            top = OOBBm3SocketHeadHole;
            bot = OOBBm3SocketHeadHole;
            h = OOBBm3SocketHeadDepth;
            translate([0,0,0]){
                OOBBCountersink3DComplete(0,0,top,bot,h,height);
            }
        }
        if(item=="M3SocketHeadFull"){
            OOBBinsert("M3SocketHead",z=OOBBm3SocketHeadDepth);
            OOBBinsert("M3HoleFull",z=0,height=height,length=length);
        }
        if(item=="M3SocketHeadFullNut"){
            OOBBinsert("M3SocketHeadFull",0,0,0,length=height);
            OOBBinsert("M3NutCaptiveSingle",0,0,z=-height+OOBBNutM3Height);
            
        }
        if(item=="M3SocketHeadUpsideDown"){
            top = OOBBm3SocketHeadHole;
            bot = OOBBm3SocketHeadHole;
            height = OOBBm3SocketHeadDepth;
            OOBBCountersink3DComplete(0,0,top,bot,height,height);
        }
        if(item=="M3Hole"){
               height=50;    
               z=height-10;
               rad=OOBBm3Hole;
               OOBBHole3DRadiusSimple(0,0,rad,height,z);

        }
        if(item=="M3HoleFull"){
               rad=OOBBm3Hole;
               OOBBHole3DRadiusSimple(0,0,rad,length,ooZ);
        }
        if(item=="M2Hole"){
               height=50;    
               z=height-10;
               rad=OOBBm2Hole;
               OOBBHole3DRadiusComplete(0,0,rad,height,z);

        }
        
        if(item=="M7Hole"){
               height=50;    
               z=height-10;
               rad=OOBBm6Hole+(1.5/2);
               OOBBHole3DRadiusComplete(0,0,rad,height,z);

        }
        if(item=="M3HoleExtra"){    
               z=ooZ;
               rad=OOBBm3Hole;
               OOBBHole3DRadiusComplete(0,0,rad,height,0);

        }
        if(item=="M3HoleScrewTop"){
               height=50;    
               z=height-10;
               rad=OOBBm3SocketHeadHole;
               OOBBHole3DRadiusComplete(0,0,rad,height,z);

        }
        
        if(item=="M3Slot"){
               height=50;    
               z=height-10;
               rad=OOBBm3Hole;
               slotw = 6;
               holeRadius = OOBBm3Hole;
               //slot
            translate([0,0,-10]){
                linear_extrude(height){
                    translate([-slotw/2+holeRadius,0,0]){
                        
                        translate([0,0,0]){
                            circle(holeRadius);
                        }
                        translate([slotw-holeRadius*2,0,0]){
                            circle(holeRadius);
                        }
                        translate([slotw/2-holeRadius,0,0]){
                            square([slotw-holeRadius*2,holeRadius*2],true);
                        }
                    }
                }
            }
        }
        if(item=="M3NutCaptive"){
           OOBBPolygon3DComplete(6,0,0,OOBBNutM3Width/2,height,0);
        }
        if(item=="M3NutClearance"){  ///clearnce for an m3 nut
            translate([0,0,-height]){
                linear_extrude(height){
                    circle(6.2/2);
                }
            }
        }
        if(item=="M3NutClearanceSlide"){ //add an extra half mm
            OOBBInsertItemMM("M3NutClearance",0,0,ooZ=0,height=5);   
            OOBBInsertItemMM("M3NutClearance",0.5,0,ooZ=0,height=5);   
            OOBBInsertItemMM("M3NutClearance",-0.5,0,ooZ=0,height=5);   
 
        }
        if(item=="M3NutCaptiveSideInsert"){ 
           OOBBPolygon3DComplete(6,0,0,OOBBNutM3Width/2,height,0);
            OOBBInsertItemMM("M3NutCaptive",0,0,ooZ=0,height=height);   
            translate([0,0,-height]){
                linear_extrude(height){
                    translate([0,10,0]){
                        square([OOBBNutM3Width,20],true);
                    }
                }
            } 
        }
        if(item=="M3NutCaptiveSingle"){
           OOBBPolygon3DComplete(6,0,0,OOBBNutM3Width/2,OOBBNutM3Height,0);
        }
        if(item=="M6NutCaptiveSingle"){
           OOBBPolygon3DComplete(6,0,0,OOBBNutM6Width/2,OOBBNutM6Height,0);
        }
        
        if(item=="TripodNutCaptive"){
           OOBBPolygon3DComplete(6,0,0,OOBBNutTripodWidth/2,OOBBNutTripodHeight,0);
        }
        if(item=="M6NutCaptiveSingleBig"){
           OOBBPolygon3DComplete(6,0,0,(OOBBNutM6Width+0.5)/2,OOBBNutM6Height+0.5,0);
        }
        if(item=="M6BoltClearance"){
                OOBBHole3DRadiusComplete(0,0,13/2,height,0);
        }
        if(item=="M6BoltClearanceCorner"){
                union(){
                OOBBHole3DRadiusSimple(0,0,13/2,height,0);
                translate([-0,-13/4,-height]){
                    linear_extrude(height){
                        square([13,13/2],true);
                    }
                }  
                translate([-13/4,0,-height]){
                    linear_extrude(height){
                        square([13/2,13],true);
                    }
                }
            }
        }
        if(item=="M6BoltClearanceSide"){
                union(){
                OOBBHole3DRadiusSimple(0,0,13/2,height,0);
                translate([-0,-13/4,-height]){
                    linear_extrude(height){
                        square([13,13/2],true);
                    }
                }  
                translate([-13/4,0,-height]){
                    linear_extrude(height){
                        //square([13/2,13],true);
                    }
                }
            }
        }
        if(item=="M6BoltClearanceMiddle"){
                union(){
                OOBBHole3DRadiusSimple(0,0,13/2,height,0);
                translate([-0,-13/4,-height]){
                    linear_extrude(height){
                        square([13,13/2],true);
                    }
                }  
                translate([-13/4,0,-height]){
                    linear_extrude(height){
                        square([13/2,13],true);
                    }
                }
            }
        }  
        if(item=="Bearing606"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing606Big,6,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing606Little,100,50);
        }
        if(item=="Bearing6806"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6806Outside,7,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6806Little,100,50);
        }
        if(item=="Bearing6808"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6808Outside,7,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6808Little,100,50);
        }
        if(item=="Bearing6810"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6810Outside,7,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6810Little,100,50);
        }
        if(item=="Bearing6806Hold"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6806OutsideHold,7,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6806Little,100,50);
        }
        if(item=="Bearing6808Hold"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6808OutsideHold,7,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6808Little,100,50);
        }
        if(item=="Bearing6810Hold"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6810OutsideHold,7,0);
            echo("6810 Hold Radius");
            echo(OOBBBearing6810OutsideHold * 2);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6810Little,100,50);
        }
        if(item=="Bearing6704"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6704Outside,4,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6704Little,100,50);
        }
        if(item=="Bearing6704Hold"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6704OutsideHold,4,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6704Little,100,50);
        }
        if(item=="Bearing6704ClearanceTube"){
                OOBBHole3DRadiusSimple(0,0,OOBBBearing6704OutsideHold+1,height,0);
        }
        
        if(item=="Bearing6704Little"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6704Little,100,50);
        }
        if(item=="Bearing6803Hold"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6803OutsideHold,5,0);
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6803Little,100,50);
        }
        if(item=="Bearing6803Little"){
                OOBBHole3DRadiusComplete(0,0,OOBBBearing6803Little,100,50);
        }
        
        
        if(item=="BearingJoiner0303"){
            OOBBInsertItemCoord("M3Hole",1.5,1);
            OOBBInsertItemCoord("M3CountersinkUpsideDown",1.5,1);
            OOBBInsertItemCoord("M3Hole",2.5,3);
            OOBBInsertItemCoord("M3CountersinkUpsideDown",2.5,3);
            
            OOBBInsertItemCoord("M3Hole",1,2.5);           
            OOBBInsertItemCoord("M3NutCaptive",1,2.5,2.4,2.4);
            OOBBInsertItemCoord("M3Hole",3,1.5);
            OOBBInsertItemCoord("M3NutCaptive",3,1.5,2.4,2.4);
        }
        if(item=="CouplerFlangeM5"){
            rotate([0,0,45]){
                OOBBInsertItemMM("M3Countersink",0,8,-1.75);
                OOBBInsertItemMM("M3Hole",0,8);
                OOBBInsertItemMM("M3Countersink",0,-8,-1.75);
                OOBBInsertItemMM("M3Hole",0,-8);
                OOBBInsertItemMM("M3Countersink",8,0,-1.75);
                OOBBInsertItemMM("M3Hole",8,0);
                OOBBInsertItemMM("M3Countersink",-8,0,-1.75);
                OOBBInsertItemMM("M3Hole",-8,0);
                OOBBHole3D(0,0);
            }
        }
        
        if(item=="NEMA17"){
            OOBBInsertItemMM("M3Hole",31/2,31/2);
            OOBBInsertItemMM("M3SocketHead",31/2,31/2,ooZ=0);
            OOBBInsertItemMM("M3Hole",-31/2,31/2);
            OOBBInsertItemMM("M3SocketHead",-31/2,31/2,ooZ=0);
            OOBBInsertItemMM("M3Hole",31/2,-31/2);
            OOBBInsertItemMM("M3SocketHead",31/2,-31/2,ooZ=0);
            OOBBInsertItemMM("M3Hole",-31/2,-31/2);
            OOBBInsertItemMM("M3SocketHead",-31/2,-31/2,ooZ=0);  
            
            /*
            OOBBCountersinkM33DComplete(31/2,31/2,z+10);
            OOBBHole3DRadius(31/2,31/2,OOBBm3Hole);
            OOBBCountersinkM33DComplete(-31/2,-31/2,z+10);
            OOBBHole3DRadius(-31/2,-31/2,OOBBm3Hole);
            OOBBCountersinkM33DComplete(31/2,-31/2,z+10);
            OOBBHole3DRadius(31/2,-31/2,OOBBm3Hole);
            OOBBCountersinkM33DComplete(-31/2,31/2,z+10);
            OOBBHole3DRadius(-31/2,31/2,OOBBm3Hole);
            */
        }
        if(item=="ServoWireClearance"){
           union(){ 
            translate([0,0,-1.5]){
                   linear_extrude(1.5){
                        square([15,4],true);
                   }
               }
            translate([1,0,-13]){
                linear_extrude(13){
                        square([4,4],true);
                   }
                }
           }
        }
        if(item=="ServoMicroHole"){
           //OOBBCube3DComplete(x,y,wid,hei,height,z)
            wid=36;
            hei=13.75;
            translate([-4,0,height]){
                OOBBCube3DComplete(0,0,wid,hei,height,0);
            }
        }if(item=="ServoHole"){
           //OOBBCube3DComplete(x,y,wid,hei,height,z)
            wid=56 + 2;
            hei=20+2;
            translate([11,0,height]){
                OOBBCube3DComplete(0,0,wid,hei,height,0);
            }
        }
        if(item=="ServoMicroHornHole"){
               //height=50;    
               //z=height-10;
               rad=7.4/2;
               OOBBHole3DRadiusComplete(0,0,rad,height,height);

        }
        if(item=="ServoMicroHornCatch"){
            translate([0,0,-1.5]){
                   extension = 0;
                    rad=7.4/2; 
                   linear_extrude(1.5){
                      square([15,5.25+extension],true);
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }translate([-7.5-(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
        }
        if(item=="ServoMicroHornCatchSingle"){
            translate([0,0,-1.5]){
                   extension = 0;
                   rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);

                    
                   linear_extrude(1.5){
                      translate([7.5/2,0,0]){
                        square([7.5,5.25+extension],true);
                      }
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }

            }
        }
        if(item=="ServoMicroHornCatchSingleContinuous"){
        translate([0,0,-4]){
        
              union(){
                
                rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,2]){
                   rad=7.4/2; 
                   linear_extrude(2){
                      
                      translate([4/2,0,0]){
                        square([4,7.1+extension],true);
                      }
                      
                      translate([5.5/2,0,0]){
                        square([8.5,6.1+extension],true);
                      }
                      
                      translate([8.5+(9/2),0,0]){
                        square([14,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
        }
    }
        if(item=="ServoMicroHornCatchSingleContinuousBottomInsertion"){
        translate([0,0,-4]){
              union(){
                extension = 0;
                rad=7.4/2;
                height=2;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,0]){
                   rad=7.4/2; 
                   linear_extrude(4.5){
                      
                      translate([4/2,0,0]){
                        square([4,7.1+extension],true);
                      }
                      
                      translate([5.5/2,0,0]){
                        square([8.5,6.1+extension],true);
                      }
                      
                      translate([8.5+(9/2),0,0]){
                        square([14,4.75+extension],true);
                      }
                      circle(rad);
                   }
                }
            }
               slotw = 3.5;
                            holeRadius = 0.75;
                            he=6;
                            //slot
                            translate([7/2+5/2,0,4]){ //move to middle of remaining piece
                                translate([-slotw/2+holeRadius,0,0]){
                                    linear_extrude(he){
                                        translate([0,0,0]){
                                            circle(holeRadius);
                                        }
                                        translate([slotw-holeRadius*2,0,0]){
                                            circle(holeRadius);
                                        }
                                        translate([slotw/2-holeRadius,0,0]){
                                            square([slotw-holeRadius*2,holeRadius*2],true);
                                        }
                                    }
                                }
                            }
        }
    }    if(item=="ServoFullHornCatchBottomInsertion"){
        translate([0,0,-5.75]){
              union(){
                extension = 0;
                rad=13.4/2; 
                height=2;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);
                translate([0,0,0]){
                   
                   linear_extrude(5.75){
                      union(){
                          translate([0,0,0]){
                           square([8.5,14+extension],true);
                          }
                          
                          translate([0,0,0]){
                           square([25,7.75+extension],true);
                          }
                          
                          circle(rad);
                      }
                   }
                }
            }
            
               slotw = 5.5;
                            holeRadius = 0.75;
                            he=6;
                            //slot
                            translate([7/2+5/2,0,5.75]){ //move to middle of remaining piece
                                translate([-slotw/2+holeRadius,0,0]){
                                    linear_extrude(he){
                                        translate([0,0,0]){
                                        circle(holeRadius);
                                        }
                                        translate([slotw-holeRadius*2,0,0]){
                                            circle(holeRadius);
                                        }
                                        translate([slotw/2-holeRadius,0,0]){
                                            square([slotw-holeRadius*2,holeRadius*2],true);
                                        }
                                    }
                                }
                            }
                            
                            //slot
                            translate([-(7/2+5/2),0,5.75]){ //move to middle of remaining piece
                                translate([-slotw/2+holeRadius,0,0]){
                                    linear_extrude(he){
                                        translate([0,0,0]){
                                            circle(holeRadius);
                                        }
                                        translate([slotw-holeRadius*2,0,0]){
                                            circle(holeRadius);
                                        }
                                        translate([slotw/2-holeRadius,0,0]){
                                            square([slotw-holeRadius*2,holeRadius*2],true);
                                        }
                                    }
                                }
                            }
            
        }
    }
        if(item=="ServoMicroHornCatchSingleBottomInsertion"){
            translate([0,0,-4]){
                   extension = 0;
                   rad=7.4/2;
                height=2.5;
                OOBBHole3DRadiusComplete(0,0,rad,height,height);

                    
                   linear_extrude(4){
                      translate([7.5/2,0,0]){
                        square([7.5,5.25+extension],true);
                      }
                      translate([7.5+(9/2),0,0]){
                        square([9,4.75+extension],true);
                      }
                      circle(rad);
                   }
                   
                   //SLOT
                            slotw = 3.5;
                            holeRadius = 0.75;
                            he=6;
                            //slot
                            translate([7/2+5/2,0,4]){ //move to middle of remaining piece
                                translate([-slotw/2+holeRadius,0,0]){
                                    linear_extrude(he){
                                        translate([0,0,0]){
                                            circle(holeRadius);
                                        }
                                        translate([slotw-holeRadius*2,0,0]){
                                            circle(holeRadius);
                                        }
                                        translate([slotw/2-holeRadius,0,0]){
                                            square([slotw-holeRadius*2,holeRadius*2],true);
                                        }
                                    }
                                }
                            }

            }
        }
        if(item=="ServoMicroMount"){
           //OOBBCube3DComplete(x,y,wid,hei,height,z)
            height=50;    
            z=height+10;
            
            translate([0,0,-10]){
                linear_extrude(height){
                    translate([-5.35,0,height]){
                        union(){
                            
                            //square
                            holeWidth = 25;
                            holeHeight = 13.75;
                            slotw = 31;
                            holeRadius = 0.75;
                            square([holeWidth,holeHeight],true);
                            
                            //slot
                            translate([-slotw/2+holeRadius,0,0]){
                                
                                translate([0,0,0]){
                                    circle(holeRadius);
                                }
                                translate([slotw-holeRadius*2,0,0]){
                                    circle(holeRadius);
                                }
                                translate([slotw/2-holeRadius,0,0]){
                                    square([slotw-holeRadius*2,holeRadius*2],true);
                                }
                            }
                        }
                    }
                }
            }
        }
        if(item=="B1X"){
            translate([0,0,-20.5]){
                eC=1;
                //OOBBCube3DComplete(x,y,wid,hei,height,z)
                OOBBCube3DComplete(0,0,100+eC,30+eC,1.5+eC,1.5+eC);//pcb
                OOBBCube3DComplete(4,0,78+eC,21+eC,18+eC,18+eC+1.5);//battery
                OOBBCube3DComplete(-37.5,13.5,9+eC,5+eC,3+eC,1.5+3+eC+eC);//switch
                OOBBCube3DComplete(-45.5,0,23+eC,15+eC,9+1.5+eC,9+eC+eC);//USB
                //solder tabs
                OOBBCube3DComplete(-37,0,7+eC,7+eC,2,1.5+2+eC);
                OOBBCube3DComplete(46.5,0,7+eC,7+eC,2,1.5+2+eC);
                
                
                
                //six header clearances
                xxx1 = -16.451;
                xxx2 = 5.46;
                xxx3 = 27.46;
                yyy1 = 12.5;
                yyy2 = -12.5;
                zzz1 = 1.5+eC+2.54;
                OOBBCube3DComplete(xxx1,yyy1,2.54*2+eC,2.54+eC,2.54+eC,zzz1);
                OOBBCube3DComplete(xxx2,yyy1,2.54*2+eC,2.54+eC,2.54+eC,zzz1);
                OOBBCube3DComplete(xxx3,yyy1,2.54*2+eC,2.54+eC,2.54+eC,zzz1);
                OOBBCube3DComplete(xxx1,yyy2,2.54*2+eC,2.54+eC,2.54+eC,zzz1);
                OOBBCube3DComplete(xxx2,yyy2,2.54*2+eC,2.54+eC,2.54+eC,zzz1);
                OOBBCube3DComplete(xxx3,yyy2,2.54*2+eC,2.54+eC,2.54+eC,zzz1);
                
                xx1 = -47.5;
                xx2 = 47.5;
                yy1 = 12.5;
                yy2 = -12.5;
                shH = 18+4.5; //needs adjusting for various thicknesses
                OOBBInsertItemMM("M3Hole",xx1,yy1);
                OOBBInsertItemMM("M3SocketHead",xx1,yy1,height=shH);
                OOBBInsertItemMM("M3Hole",xx1,yy2);
                OOBBInsertItemMM("M3SocketHead",xx1,yy2,height=shH);
                OOBBInsertItemMM("M3Hole",xx2,yy1);
                OOBBInsertItemMM("M3SocketHead",xx2,yy1,height=shH);
                OOBBInsertItemMM("M3Hole",xx2,yy2);
                OOBBInsertItemMM("M3SocketHead",xx2,yy2,height=shH);
               
              //bottom side components
                OOBBCube3DComplete(0,0,88,26,3+eC,0);//mainCavity
                OOBBCube3DComplete(40,11.5,9,7,2.5+eC,0);//usb micro
                OOBBCube3DComplete(-46,0,8,16,5+eC,0);//usbBig
                OOBBCube3DComplete(40.5,-11.5,9,5,2+eC,0);//littleChip
              //captive nuts
                OOBBInsertItemMM("M3NutCaptiveSingle",xx1,yy1,ooZ=-6.5+OOBBNutM3Height);
    OOBBInsertItemMM("M3NutCaptiveSingle",xx1,yy2,ooZ=-6.5+OOBBNutM3Height);
    OOBBInsertItemMM("M3NutCaptiveSingle",xx2,yy1,ooZ=-6.5+OOBBNutM3Height);
    OOBBInsertItemMM("M3NutCaptiveSingle",xx2,yy2,ooZ=-6.5+OOBBNutM3Height);
       
                
                
            }
            
        }
        if(item=="ServoFullMount"){
           //OOBBCube3DComplete(x,y,wid,hei,height,z)
            height=50;    
            z=height+10;
            x1 = 14;
            y1 = 5;
            x2 = -36;
            y2 = -5;
            
            translate([0,0,-10]){
                difference(){
                    union(){
                        
                        linear_extrude(height){
                            translate([-11,0,height]){
                                    //square
                                    holeWidth = 42 + 0.5;
                                    holeHeight = 21 + 0.5;
                                    holeRadius = 0.75;
                                    square([holeWidth,holeHeight],true);
                                    //holes
                                    x1 = 14;
                                    y1 = 5;
                                    x2 = -36;
                                    y2 = -5;
                            }                    
                        }
                        translate([-11,0,10+4]){
                            linear_extrude(2.5){
                                    //square
                                    holeWidth = 56 + 2;
                                    holeHeight = 21 + 2;
                                    holeRadius = 0.75;
                                    square([holeWidth,holeHeight],true);
                                    //holes
                                    x1 = 14;
                                    y1 = 5;
                                    x2 = -36;
                                    y2 = -5;
                            }                    
                        }
                    }
                
                h2= 4 + 2.5;
                //translate([0,0,10+h2]){
                //    OOBBInsertItemMM("M45Sock",x1,y1,height=h2);
                //    OOBBInsertItemMM("M45Sock",x1,y2,height=h2);
                //    OOBBInsertItemMM("M45Sock",x2,y1,height=h2);
                //    OOBBInsertItemMM("M45Sock",x2,y2,height=h2);
                //}
            }
            }
        
            
            OOBBInsertItemMM("M3Hole",x1,y1);
            OOBBInsertItemMM("M3SocketHead",x1,y1,height=6.5+OOBBm3SocketHeadDepth);
            OOBBInsertItemMM("M3NutCaptiveSingle",x1,y1,OOBBNutM3Height);
            OOBBInsertItemMM("M3Hole",x1,y2);
            OOBBInsertItemMM("M3SocketHead",x1,y2,height=6.5+OOBBm3SocketHeadDepth);
            OOBBInsertItemMM("M3NutCaptiveSingle",x1,y2,OOBBNutM3Height);
            OOBBInsertItemMM("M3Hole",x2,y1);
            OOBBInsertItemMM("M3SocketHead",x2,y1,height=6.5+OOBBm3SocketHeadDepth);
            OOBBInsertItemMM("M3NutCaptiveSingle",x2,y1,OOBBNutM3Height);
            OOBBInsertItemMM("M3Hole",x2,y2);
            OOBBInsertItemMM("M3SocketHead",x2,y2,height=6.5+OOBBm3SocketHeadDepth);
            OOBBInsertItemMM("M3NutCaptiveSingle",x2,y2,OOBBNutM3Height);
        }if(item=="ServoFullMountTop"){
            x1 = 14;
            y1 = 5;
            x2 = -36;
            y2 = -5;
            
            translate([0,0,3]){
                difference(){
                    union(){
                        servoHeight = 30;
                        //servoHole
                        translate([0,0,-servoHeight]){
                            linear_extrude(height+servoHeight){
                                translate([-11,0,0]){
                                        //square
                                        holeWidth = 42 + 2;
                                        holeHeight = 21 + 0.5;
                                        holeRadius = 0.75;
                                        square([holeWidth,holeHeight],true);
                                        //holes
                                        x1 = 14;
                                        y1 = 5;
                                        x2 = -36;
                                        y2 = -5;
                                }                    
                            }
                        }
                        
                        //servoBracketHolw
                        translate([-11,0,-3]){
                            linear_extrude(3+height){
                                    //square
                                    holeWidth = 56 + 2;
                                    holeHeight = 21 + 1;
                                    holeRadius = 0.75;
                                    square([holeWidth,holeHeight],true);
                                    //holes
                                    x1 = 14;
                                    y1 = 5;
                                    x2 = -36;
                                    y2 = -5;
                            }                    
                        }
                        
                    }
                }
            }
            screwLength=12;
            OOBBinsert("M3SocketHeadFullNut",x1,y1,height=6.5+OOBBm3SocketHeadDepth,length=screwLength);
            OOBBinsert("M3SocketHeadFullNut",x2,y1,height=6.5+OOBBm3SocketHeadDepth,length=screwLength);
            OOBBinsert("M3SocketHeadFullNut",x1,y2,height=6.5+OOBBm3SocketHeadDepth,length=screwLength);
            OOBBinsert("M3SocketHeadFullNut",x2,y2,height=6.5+OOBBm3SocketHeadDepth,length=screwLength);
        }
      if(item=="M45Sock"){
          cylinder(height,4.4/2,4.4/2,true);
      }  
      if(item=="SetScrewKeyway"){
          rotate([90,0,0]){
              height=50;    
              z=50;
              rad=5/2;
              OOBBHole3DRadiusComplete(0,0,rad,height,z);
          }
      }
      if(item=="PiCameraMount"){
          OOBBInsertItemMM("M2RivetUpsideDown",-10.5,10,0);
          OOBBInsertItemMM("M2RivetUpsideDown",-10.5,-2.5,0);
          OOBBInsertItemMM("M2RivetUpsideDown",10.5,10,0);
          OOBBInsertItemMM("M2RivetUpsideDown",10.5,-2.5,0);
          translate([0,2,-10]){
              linear_extrude(20){
                  square([12,25],true);
              }
          }
          translate([7,8,-ooZ]){
              linear_extrude(1.5){
                  square([5,4],true);
              }
          }
          translate([-10,3.5,-ooZ]){
              linear_extrude(1.5){
                  square([3,8],true);
              }
          }
      }
      if(item=="PiZeroMount"){
          OOBBInsertItemMM("M27Rivet",-29,11.5,0);
          OOBBInsertItemMM("M27Rivet",-29,-11.5,0);
          OOBBInsertItemMM("M27Rivet",29,11.5,0);
          OOBBInsertItemMM("M27Rivet",29,-11.5,0);
          translate([0,-11.5,3]){
              linear_extrude(3){
                  square([52,7],true);
              }
          }
      }
      if(item=="PiZeroMountUpsideDown"){
          OOBBInsertItemMM("M27RivetUpsideDown",-29,11.5,0);
          OOBBInsertItemMM("M27RivetUpsideDown",-29,-11.5,0);
          OOBBInsertItemMM("M27RivetUpsideDown",29,11.5,0);
          OOBBInsertItemMM("M27RivetUpsideDown",29,-11.5,0);
          translate([0,-11.5,0]){
              linear_extrude(3){
                  square([52,7],true);
              }
          }
        //extra cutout for rivet clearance
        translate([0,-11.5,0]){
            linear_extrude(1.5){
                square([58,OOBBm27RivetClearance*2],true);
            }
        }
      }
      if(item=="OOEBNormal"){
         OOEBNormalInsert(ex=ex);
      }
      if(item=="OOEBNormalUpsideDown"){
          
         OOEBNormalInsertUpsideDown(ex=ex);
          
      }
      
      if(item=="OOEBNormalCableUpsideDown"){
          if(ex==0){
            OOEBNormalCableInsertUpsideDown(0.5);
          }else{
            OOEBNormalCableInsertUpsideDown(ex);
          }
      }
      if(item=="OOEBNormalCable"){
       //needs shifting to be right
           ex=0.1;
          translate([0,0,0]){
          //top
            translate([0,0,0]){  
                linear_extrude(6.23){
                    square([2.54*4+ex,2.54+ex],true);
                }
            }  
          //bar
            translate([0,0,-2.54]){  
                linear_extrude(2.54+ex){
                    square([2.54*6+ex,2.54+ex],true);
                }
            }     
          //header
            translate([2.54/2,0,-2.54-14]){  
                linear_extrude(14){
                    square([2.54*3+ex,2.54+ex],true);
                }
            }
            //cable
            translate([2.54/2,0,-2.54-14-3]){  
                linear_extrude(3){
                    square([5.62+ex,2.54+ex],true);
                }
            }      
          }
          
      }
      if(item=="OOEBDual"){
          OOEBextra = 0.5;
          translate([2.54/2,0,-8.5]){
              union(){
                  OOBBcubeAngled(0,0,8.5,2.54*2+OOEBextra,2.54+OOEBextra,3,0.5);
                linear_extrude(8.5){
                    square([2.54*2+OOEBextra,2.54+OOEBextra],true);
                }
            }
        }
      }
      if(item=="OOEBARDCUpsideDown"){
          translate([0,0,-13]){
            ex = 1;
            //board
            translate([0,0,0]){  
                linear_extrude(10){
                    square([18+ex,45+ex],true);
                }
            }
            //usb
            translate([0,-18.574,-4.5+1.3]){
                linear_extrude(4.5){
                    square([8+ex,9+ex],true);
                }
            }
            //left pins
            translate([-7.62,-0.318,-7.5+8]){
                linear_extrude(12){
                    square([2.54+ex,2.54*15+ex],true);
                }
            }
            //left pins
            translate([7.62,-0.318,-6.5+8]){
                linear_extrude(12){
                    square([2.54+ex,2.54*15+ex],true);
                }
            }
        }
      }
      if(item=="OOEBDCJA"){
          translate([0,0,-14]){
            linear_extrude(14){
                square([9+2,14+1],true);
            }
        }
      }
      
      
      
        
    }   
}

module OOBBcylinder(height,radius1,radius2){
    union(){
        translate([0,0,OOBBfirstLayerLipDepth]){
            cylinder(height - OOBBfirstLayerLipDepth,radius1,radius2);
            
        }
       cylinder(OOBBfirstLayerLipDepth,radius1-OOBBfirstLayerLipOffset,radius2-OOBBfirstLayerLipOffset);            
        }
}

module OOBBcubeAngled(x,y,z,width,height,depth,extra){
   /*
    CubePoints = [
  [  0,  0,  0 ],  //0
  [ 10,  0,  0 ],  //1
  [ 10,  7,  0 ],  //2
  [  0,  7,  0 ],  //3
  [  0,  0,  5 ],  //4
  [ 10,  0,  5 ],  //5
  [ 10,  7,  5 ],  //6
  [  0,  7,  5 ]]; //7
  
CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
polyhedron( CubePoints, CubeFaces );
    */
    CubePoints = [
                  [  0,  0,  0 ],  //0
                  [ width,  0,  0 ],  //1
                  [ width+2*extra,  -2*extra,  depth ],  //2
                  [  -2*extra,  -2*extra,  depth ],  //3
                  [  0,  height,  0 ],  //4
                  [ width,  height,  0 ],  //5
                  [ width+2*extra,  height+2*extra,  depth ],  //6
                  [  -2*extra,  height+2*extra,  depth ]]; //7
  
    CubeFaces = [
                  [0,1,2,3],  // bottom
                  [4,5,1,0],  // front
                  [7,6,5,4],  // top
                  [5,6,2,1],  // right
                  [6,7,3,2],  // back
                  [7,4,0,3]]; // left
    translate([-width/2,-height/2,z-height]){
        polyhedron( CubePoints, CubeFaces );
    }
    
}

module OOEBNormalInsert(ex){
    translate([3.81,0,-8.5]){
        //OOBBcubeAngled(x,y,z,width,height,depth,extra);
        union(){
            OOBBcubeAngled(0,0,8.5,2.54*4+ex,2.54+ex,3,0.5);
            linear_extrude(8.5){
                square([2.54*4+ex,2.54+ex],true);
            }
        }
    }
}

module OOEBNormalInsertUpsideDown(ex){
    translate([0,0,0]){
            //OOBBcubeAngled(x,y,z,width,height,depth,extra);
            union(){
                  OOBBcubeAngled(0,0,3.5,2.54*4+ex+0.5*2,2.54+ex+0.5*2,3,-0.5);
                  
                linear_extrude(8.5){
                    square([2.54*4+ex,2.54+ex],true);
                }
            }
        }
}

module OOEBNormalCableInsertUpsideDown(ex){
          OOBBInsertItemMM("OOEBNormalUpsideDown",0,0,0,ex=0);
          translate([0,0,0]){
          //top
            translate([0,0,0]){  
                linear_extrude(6){
                    square([2.54*4+ex,2.54+ex],true);
                }
            }  
          //bar
            translate([0,0,6]){  
                linear_extrude(2.54+ex){
                    square([2.54*6+ex,2.54+ex],true);
                }
            }     
          //header
            translate([2.54/2,0,6+2.54+ex]){  
                linear_extrude(14){
                    square([2.54*3+ex,2.54+ex],true);
                }
            }
            //cable
            translate([2.54/2,0,6+2.54+ex+14]){  
                linear_extrude(3){
                    square([5.62+ex,2.54+ex],true);
                }
            }      
          }
}
//============================================================
// OpenSCAD
// Regular Convex Polygon Library
// Last Modified : 2015/10/28
// Source: https://www.thingiverse.com/thing:335968
//============================================================
/*

	Definition

	N = Number of Side N >=3
	A = apothem
		radius of inside circle
	R = circumradius
		Radius of outside circle
	S = Side
		Lenght of a side

	Build polygon with the Apothem :
	N and A is known
	Need to calculate S then R

	Build Polygon with Circumradius
	N and R known

	Build Polygon with Side
	N and S Known
	Need to calculate R and optionaly A

	TO DO
    Control result

	For more information :
	http://en.wikipedia.org/wiki/Regular_polygon

*/

//------------------------------------------------------------
//
//------------------------------------------------------------
//Demo();

//------------------------------------------------------------
// Demo
//------------------------------------------------------------
module Demo()
{
	inch = 25.4;	// 25.4mm
	// A = apothem - it's a RADIUS !
	// For a bolt of 4 inches spécify A=2*inch
	Polygon(N=6,A=2*inch,h=0);	// 4 inches radius Polygon
	//Polygon(N=7,A=49.8365,h=0);
	//Trigon(A=50,h=10);			// N=3
	//Dodecagon(A=50,h=0);			// N=12

    //rotate([0,0,360/7/2])
	//Nonagon(R=55.3144,h=10,debug=true);

	//Polygon(N=6,A=60,h=0,debug=false);
	//Polygon(N=6,A=60,h=5,debug=true);

    //Enneagon(A=50);
}


//------------------------------------------------------------
// Polygon : 
//------------------------------------------------------------
module Polygon(N=3,A=0,R=0,S=0,h=0,debug=false)
{
	N = ( N < 3 ? 3 : N );

	angle = 360/N;
	angleA = angle/2;

	if (debug)
	{
		echo("N = ", N);
		echo("A = ", A);
		echo("S = ", S);
		echo("R = ", R);
	}

	if ( A > 0 )		// if A assign R and S
	{
        S = 2 * A * tan(angleA);							// assign
		//R = (S/2) / sin(angleA);						// no assign ???
		R = ( A * tan(angleA) ) / sin(angleA);		// asign
		_Build_Polygon(N=N,R=R,h=h);
		if (debug)
		{
			echo("aN = ", N);
			echo("aA = ", A);
			echo("aS = ", S);
			echo("aR = ", R);
		}
	}
	else
	{
		if ( S > 0 )		// if S assign R and A
		{
			R = (S/2) / sin(angleA);			// assign
			A = S / ( 2 * tan(angleA) );		// assign
            _Build_Polygon(N=N,R=R,h=h);
			if (debug)
			{
				echo("sN = ", N);
				echo("sA = ", A);
				echo("sS = ", S);
				echo("sR = ", R);
			}
		}
		else
		{
			if ( R == 0 )		// default
			{
				S = 2 * R * sin(angleA);			// no assign ???
				A = S / ( 2 * tan(angleA) );		// no assign ???
				_Build_Polygon(N=N,h=h);
				if (debug)
				{
					echo("0N = ", N);
					echo("0A = ", A);
					echo("0S = ", S);
					echo("0R = ", R);
				}
			}
			else		// build with R
			{
				S = 2 * R * sin(angleA);
				A = S / ( 2 * tan(angleA) );			// no assign ???
				//A = R * ( sin(angleA) / tan(angleA) )	// no assign ???
				_Build_Polygon(N=N,R=R,h=h);
				if (debug)
				{
					echo("rN = ", N);
					echo("rA = ", A);
					echo("rS = ", S);
					echo("rR = ", R);
				}
			}
		}
	}

	if (debug)
	{
		echo("fN = ", N);
		echo("fA = ", A);
		echo("fS = ", S);
		echo("fR = ", R);
	}
}

//------------------------------------------------------------
// Build
//------------------------------------------------------------
module _Build_Polygon(N=3,R=1,h=0)
{
	if (h > 0)
	{
		// 3D primitive h>0
	}
	else
	{
		// 2D primitive h=0
        
	}
}

//------------------------------------------------------------
// Building lots from N=3, N=N+1
// http://en.wikipedia.org/wiki/Polygon
//------------------------------------------------------------

// 3 sides
module Trigon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=3,A=A,R=R,S=S,h=h,debug=debug);}

module Triangle(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=3,A=A,R=R,S=S,h=h,debug=debug);}

// 4 sides
module Tetragon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=4,A=A,R=R,S=S,h=h,debug=debug);}

module Quadrilateral(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=4,A=A,R=R,S=S,h=h,debug=debug);}

module Quadrangle(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=4,A=A,R=R,S=S,h=h,debug=debug);}

// 5 sides
module Pentagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=5,A=A,R=R,S=S,h=h,debug=debug);}

// 6 sides
module Hexagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=6,A=A,R=R,S=S,h=h,debug=debug);}

// 7 sides
module Heptagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=7,A=A,R=R,S=S,h=h,debug=debug);}

// 8 sides
module Octagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=8,A=A,R=R,S=S,h=h,debug=debug);}

// 9 sides
module Enneagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=9,A=A,R=R,S=S,h=h,debug=debug);}

module Nonagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=9,A=A,R=R,S=S,h=h,debug=debug);}

// 10 sides
module Decagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=10,A=A,R=R,S=S,h=h,debug=debug);}

// 11 sides
module Handecagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=11,A=A,R=R,S=S,h=h,debug=debug);}

// 12 sides
module Dodecagon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=12,A=A,R=R,S=S,h=h,debug=debug);}

// ...

// 100 sides
module Hectogon(A=0,R=0,S=0,h=0,debug=false)
	{Polygon(N=100,A=A,R=R,S=S,h=h,debug=debug);}

//==EOF=======================================================