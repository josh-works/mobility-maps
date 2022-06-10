require 'ostruct'

activity_2_params = {
  "strava_id": 5644576254, 
  "name": "Peddling around the city", 
  "distance": 9736.8, 
  "moving_time": 3397, 
  "elapsed_time": 13322, 
  "total_elevation_gain": 100.6, 
  "elev_high": 1780.3, 
  "elev_low": 1723.9, 
  "average_speed": 2.866, 
  "max_speed": 12.2, 
  "start_date": "2021-07-17 22:38:48+00:00"}
activity_3_params = {
  "strava_id": 5639327245, 
  "name": "Night Ride", 
  "distance": 1605.7, 
  "moving_time": 519, 
  "elapsed_time": 564, 
  "total_elevation_gain": 50.7, 
  "elev_high": 1780.2, 
  "elev_low": 1728.5, 
  "average_speed": 3.094, 
  "max_speed": 7.5, 
  "start_date": "2021-07-17 03:38:01+00:00"}
# 
# Activity.create_with( activity_1_params ).find_or_create_by(strava_id: activity_1_params[:strava_id])
# Activity.create_with( activity_2_params ).find_or_create_by(strava_id: activity_2_params[:strava_id])
# Activity.create_with( activity_3_params ).find_or_create_by(strava_id: activity_3_params[:strava_id])



#####################################################
#     HERE BE MANY RAW NOTES AND CODE SNIPPETS     #
#####################################################
# activity = Activity.find_by(strava_id: 5644576254)
# ActivityPolyline.create_with(activity)

# 
# NetworkUserTeam.new(
#   mobility_network_user: mnu,
#   team: team
#   )
# # associate Activity with MobilityNetworkUser
# mnu.activity.create(activity)

## Later Round
#
# # And I should be able to go to the browser and visit `localhost:3000/mnu_guid/activity_guid`
# #
# extra_run_1 = {id: "strava-provided-id1", polyline: "polyline1"}
# extra_run_2 = {id: "strava-provided-id2", polyline: "polyline2"}
# extra_run_3 = {id: "strava-provided-id3", polyline: "polyline3"}
#
#
# Activity.associate_run(extra_run_1)
# Activity.associate_run(extra_run_2)
# Activity.associate_run(extra_run_3)
#
# mnu.activities.first.run
# => extra_run_1
#
# Team.members.first
# => mnu

# :strava_id = nil,
# :name = nil,
# :distance = nil,
# :moving_time = nil,
# :elapsed_time = nil,
# :total_elevation_gain = nil,
# :elev_high = nil,
# :elev_low = nil,
# :average_speed = nil,
# :max_speed = nil,
# :start_date = nil,
##############################################
# RUN AND MODIFY CODE HERE ####
##############################################
class Activity
  attr_reader :strava_id,
                :name,
                :distance,
                :moving_time,
                :elapsed_time,
                :total_elevation_gain,
                :elev_high,
                :elev_low,
                :average_speed,
                :max_speed,
                :start_date
  def initialize(opts = {})
    @strava_id = opts[:strava_id]
    @name = opts[:name]
    @distance = opts[:distance]
    @moving_time = opts[:moving_time]
    @elapsed_time = opts[:elapsed_time]
    @total_elevation_gain = opts[:total_elevation_gain]
    @elev_high = opts[:elev_high]
    @elev_low = opts[:elev_low]
    @average_speed = opts[:average_speed]
    @max_speed = opts[:max_speed]
    @start_date = opts[:start_date]
  end
end

class Polyline
  def initialize(opts = {})
    @strava_id = opts[:strava_id]
    @polyline = opts[:polyline]
  end
end


# oh fuck
activity_1_params = {
  "strava_id": 5648639527,
  "name": "Church to clear Creek",
  "distance": 968.9,
  "moving_time": 612,
  "elapsed_time": 3366,
  "total_elevation_gain": 2.8,
  "elev_high": 1742.7,
  "elev_low": 1729.7,
  "average_speed": 1.583,
  "max_speed": 5.5,
  "start_date": "2021-07-18 16:12:33+00:00"
}

activity = Activity.new(activity_1_params)

polyline_params = {
  strava_id: 5648639527,
  polyline: "egcqFp_w_SAEGCFDC??JGGUZMd@Gx@A|A@|@?jBNhICrABpBE~@AfDHfBClBAPGLc@EaC@kCGiCD_BFkAEmCB_HGcBFwACu@Ds@N[AA@JBBDACC?KJa@BIFSZCJJlC@xA?rADhFClFBrAAxA@VEpBBfDAhD@dDQjNAJUKKCuB\q@Rq@b@UTi@v@iC|E{AlCYZo@l@{A~@MJGLG`@@dJGhCEjFK`GBnCJzBBpDG|IDbAGhE@hDBdAAxDGxB@nAIl@DDBr@GpJFvAAtAD|BHlBAVGRBl@?hCEt@ApCKnACr@@h@NzBDrA?^HH@JBzAEv@ECCPCrADfIApBIdBApBHvEAf@IhAKfC?pAFhCFpELbEAt@B`CFfBBpBEhEDvAAxFFxCAnAG~AB~FEnC?`DIrBDpCIpDClDBxBGhEF`DHvC?tBOrIB`AEdFFrD?tCIzEFnB?v@HHEZAl@FhDChCDvHAfDE|B@nCCzH@fEJzECnA?vFEpCH`IAhED|FElAAjBDhIGlDD~GChCOrGFvCF~@Ib@@p@CxB?tAF|A?xAKxCK~JLhNDnABzKChHEzA@|CCzCBdGE|ATxKA~BG`BAp@LxGC|HRxG?v@EdE?bDF`FEhH?|CDrE?zCErEKdEBzEGvHF|CEtCG~A?|ABtA?~BBrADNRDa@?LJIB?JApCH|ABdCCpIHxEAxHGnF?hC@lE?GFhA@`BFtIC`X?d@Df@V|AbCfIl@nCz@`DnBbI^`CP`BH~AZbKZdIDhDAp@Ep@S|AMn@o@fCgEvOoCxJ]dCK|AAr@@~FD`CFp@X`Bn@~BZvAL`BBl@CpAGfB?OCIAFUHEN?DTTDLYbCDzAFj@ZrAh@lBfAbDNj@Jj@f@hEBp@AhBMdBk@`Ek@dFUrCw@bFYxC_@tCYfD[bBqA`Gq@pD[zBk@jDy@dHi@fDm@vB_BxEUt@oA`FoAnEkApEi@bBeArCq@tAeAlBmCtFi@~@g@`A]`Ag@rBEf@ApALnCD^ZlA^fAr@pAt@r@FVAHEHWPe@J_AFcA@o@FaEtAc@HwC\}D\sBLiA?mAC{Mq@}DMaE]cAC[D_Cz@sGhBaBj@{@VmDfA_GrAsBl@oBr@iHbDc@NkAXkALe@@kAEsC[eAWmAe@e@W_@Yu@u@w@o@YYW[_AgB{AeEi@cAq@q@YQUKWAUBUFSL_@`@MTsBnG{@bC_AzBu@jA_AhAeA`Aa@T}@b@eEvAe@LqARuAL{AFqIVoCTqD`@UJSNOT_AnBOVMFE?GCSUKUM]YgAuA}Dc@wA{AaEkDwKuAeE_A{C]u@Ia@BGIc@IWq@oAuAwDeAyBi@sACA@AGAH?@DOGQ@INCZEdBChFFfEB~DDdVLtDBA?EBD?FKp@Q`@YhFc@fB{@rCQd@k@jAYd@qA`BeHnHiBbCWf@kA`Dq@zCQpA[dD]jCc@hCi@xBQb@eChEgBbCwAzAcDxBkCnBkCxBqD`DmBzAiHnGg@ZoAdAkBrAmDvCkBrAgB|AkBvAiB`BsDpCsApA{EjDkAn@eCfAk@`@gA|@y@h@M@IAICSSY_@aB_Ds@iACOAQDg@COM?GFOb@IL}@dA}@x@eBlBaA|@gAz@KNSr@Wf@eDpCoAnAGDG?UOGK_@cAkAqCIEK@eAjAwApAiC|CgAx@GLi@j@iBvAK@UIKKc@mA[s@_@uAeDyGiA{CkAgCYa@IEQFMJs@z@gB`BkAlA}C`CiDrC[T{BrBs@j@eB|AcBlB}AvAuFvEkAhAw@p@cAjAeAr@k@p@gA|Aq@|@_B`C?Os@}Aa@u@w@iCBGH@BAAEBD@AAEEBHAGBJA?BHIAB"
}

pl = Polyline.new(polyline_params)

# pl.activity
# activity.pl

require "pry"; binding.pry
