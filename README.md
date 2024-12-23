The data set et used in this study is open access and can be obtained using this link (https://zenodo.org/records/7865542) 
An e-mail to CANEK.CICESE@gmail.com is requested before access is granted for the purposes of user registration.


Visualizing the results:

GRL_FIG1_a.m: Generates the figure showing the location of the moorings (panel a).

GRL_FIG1_b.m: Produces the schematic of the vertical structure of the YCu velocity core (panel b).

GRL_FIG1_c_d.m: Generates the figures for the average of the velocity component perpendicular to the YC and its variance (panels c and d).

GRL_FIG1_e_f.m: Produces the figures for the spatial structure of EOF1 and the time series of PC1 (panels e and f).


GRL_FIG2_a_b_d_e.m:

a) Generates the time series for V_max and L_max.

b) Produces the time series for V_cnt and L_cnt, including the quartile distribution (Q1 to Q3).

d) Creates the time series for the Loop Current (LC) extension (Lat_LC) and area (A_LC); blue crosses represent LC eddy shedding events.

e) Generates the time series for the amplitude of PC1 and the horizontal displacement of the contour centroid (L_cnt), including the Pearson correlation coefficient (r).

GRL_FIG3_a.m: Generates the histograms of V_max and V_cnt in the YC, showing the quartile distributions and the joint probability density functions (PDFs) between velocity and longitudinal position.


GRL_FIG3_b_c.m:

b) Produces the mean cross-channel velocity distribution for different quartiles of V_cnt, with color scales representing velocity amplitude and the YCu velocity core marked.

c) Generates the mean ADT distribution for different quartiles, indicating the 50-cm-ADT contour and the position of LCE shedding events (represented by blue crosses) and the latitudinal limit (23°N).

GRL_FIG4_a.m: Generates the scatterplot showing the relationship between the horizontal position (L_cnt) and velocity (V_cnt) of the centroid, including the linear least squares fit.


GRL_FIG4_b_c_d_e.m:

b) Produces the time series comparing the width of the surface 0.3 ms⁻¹ contour for the AVISO and CANEK datasets.

c) Generates the evolution of the area from the CANEK data.

d) Shows the evolution of the centroid position obtained using Gauss’s Area method and its approximation.

e) Produces the velocity time series for the CANEK measurement periods and the velocity proxy with the linear least squares fit, including Pearson correlation coefficient values (r).


poligonos.m: This code calculates the area and centroid of a polygon using Gauss's formula. It iterates through the vertices of the polygon to compute the area and the coordinates of the centroid (x, y).



