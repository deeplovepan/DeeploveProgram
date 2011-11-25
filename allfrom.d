#!/usr/sbin/dtrace -Fs
/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License, Version 1.0 only
 * (the "License").  You may not use this file except in compliance
 * with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
 /*
 * Copyright 2005 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 */

pid$2::$1:entry
{
	self->start = vtimestamp;
}

pid$2:::entry
/self->start/
{
	trace(vtimestamp - self->start);
}

pid$2:::return
/self->start/
{
	trace(vtimestamp - self->start);
}

pid$2::$1:return
/self->start/
{
	self->start = 0;
	exit(0);
}

syscall:::
/self->start/
{
	trace(vtimestamp - self->start);
}

fbt:::
/self->start/
{
	trace(vtimestamp - self->start);
}
